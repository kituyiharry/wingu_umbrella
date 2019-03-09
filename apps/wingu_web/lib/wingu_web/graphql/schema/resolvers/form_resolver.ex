defmodule WinguWeb.GraphQL.Resolvers.FormResolver do
  alias Wingu.{Companies, Repo, Forms, FormData, FormTemplates, SectionNodes, DescriptionNodes, Clients, TextNodeData}
  alias WinguWeb.{GraphQL.Helpers}
  alias Ecto.Multi

  import Ecto.Query
  require IO

  def forms(_parent, %{company: id}, %{context: %{"sub" => _id}}) do
    company = Companies.get_company!(id) |> Repo.preload(:forms)
    {:ok, company.forms}
  end

  def create_form(_parent, %{company: company, form: %{name: n, summary: s, description: d, template: t}}, %{context: %{"sub" => _id}}) do    
    ## Substitute to Multi format, easy to handle
    mul = Multi.new()
          |> Multi.run(:get_company, fn repo,_change -> 
            case repo.get(Companies.Company, company) do
              %Companies.Company{} = com ->
                {:ok, com}
              _ ->
                {:error, "Unable to fetch the company"}
            end
          end)
          |> Multi.insert(:form, fn %{get_company: company} -> 
            # Associate the form and Convert into a Form Changeset
            Ecto.build_assoc(company, :forms) |> Forms.Form.changeset(%{name: n, summary: s, description: d})
          end)
          |> Multi.insert(:template, fn %{form: form} -> 
            # Associate the FormTemplate and Convert into a FormTemplate Changeset
            Ecto.build_assoc(form, :form_templates) |> FormTemplates.FormTemplate.changeset(%{}) 
          end)
          |> Multi.merge(fn %{template: template} -> 
            # Delegate to handler Function
            Enum.with_index(t.sections)|> Enum.reduce(Multi.new(), fn {entry, index}, multi ->
              key = "sections_#{index}"
              nodes = entry.nodes
              Multi.insert(multi, key, fn _empty -> 
                Ecto.build_assoc(template, :sections_nodes) |> SectionNodes.SectionNode.changeset(entry)
              end) 
              # Capture each new section and Merge this transaction
              |> Multi.merge(fn %{^key => section} -> 
                dkey = "nodes_#{key}"
                nodes |> Enum.with_index() |> Enum.reduce(Multi.new(), fn {subnode, index}, multi -> 
                  key = "insert_#{dkey}_#{index}"
                  Multi.insert(multi, key, fn _changes -> 
                    Ecto.build_assoc(section, :description_nodes) |> DescriptionNodes.DescriptionNode.changeset(subnode)
                  end) 
                end)
              end)
            end)
          end)
    case Repo.transaction(mul) do
      {:ok, %{:form => form}} ->
        {:ok, form}
      {:error, _key, change, _ops} ->
        {:error, Helpers.translate_error(change)}
      _ ->
        {:error, "Unknown operation"}
    end
  end

  def fill_form(_parent, %{form_id: id, data: sections}, %{context: %{"sub" =>  sub}}) do
    formdata = Multi.new()
    # Get the associated client and form as context operation 
    |> Multi.run(:context, fn repo,_changes -> 
      case {repo.get(Clients.Client, sub), repo.get(Forms.Form, id)} do
        {%Clients.Client{} = client, %Forms.Form{} = form} ->
          {:ok, %{:client => client, :form => form}}
        _ ->
          {:error, "Client or Form couldn't be fetched"}
      end
    end)
    |> Multi.run(:form_filled, __MODULE__, :is_form_filled, [sections])
    # Create a FormData struct and associate it
    |> Multi.insert(:formdata, fn %{:context => %{:form => form, :client => client}} -> 
      Ecto.build_assoc(form, :form_data) |> Ecto.Changeset.change() |> Ecto.Changeset.put_assoc(:client, client)
    end)
    # Merge with relevant section and Subnodes
    |> Multi.merge(fn %{:formdata => formdata} -> 
      sections |> Enum.reduce(Multi.new(), fn section,multi -> 
        key = section.section
        section_node = SectionNodes.get_section_node!(section.section)
        Multi.insert(multi, key, fn _change -> 
          Ecto.build_assoc(section_node, :section_data) |> Ecto.Changeset.change() |> Ecto.Changeset.put_assoc(:form_datum, formdata)
        end)
        |> Multi.merge(fn %{^key => section_data} -> 
          section.nodes 
          |> Enum.reduce(Multi.new(), fn node, multi -> 
            nest_key = node.node
            desc_node = DescriptionNodes.get_description_node!(node.node)
            Multi.insert(multi, nest_key, fn _change -> 
              Ecto.build_assoc(desc_node, :text_node_data) 
              |> TextNodeData.TextNodeDatum.changeset(%{node_value: node.value})
              |> Ecto.Changeset.put_assoc(:section_datum, section_data)
            end)
          end)
        end)
      end) 
    end) 
    case Repo.transaction(formdata) do
      {:ok, %{:formdata => formdata}} ->
        {:ok, formdata}
      {:error, _key, change, _ops} ->
        {:error, Helpers.translate_error(change)}
      _ ->
        {:error, "Unknown operation"}
    end
  end

  def is_form_filled(repo, %{context: %{form: form}}, data) when is_list(data) do
    preload = repo.preload(form, :form_templates)
    temp  = preload.form_templates
    form_template = from(template in FormTemplates.FormTemplate,
      where: template.id == ^temp.id,
      left_join: section_node in assoc(template, :sections_nodes),
      left_join: description_node in assoc(section_node, :description_nodes),
      group_by: [template.id],
      select: {count(section_node), count(description_node)}) |> repo.one()
    case Enum.reduce(data, {0, 0}, fn section, {itemcount, subcount} -> {itemcount+1, subcount+length(section.nodes)} end) do
      ^form_template ->
        {:ok, form_template}
      e->
        {:error, "Form is missing some values or sections"}
    end
  end

  def delete_form(_parent, %{form: form}, %{context: %{"sub" => sub}}) do
    delform = Multi.new()
              |> Multi.run(:fetch_form, fn repo, _changes -> 
                {:ok, repo.get!(Forms.Form, form)}
              end)
              |> Multi.delete(:delete, fn %{fetch_form: form} -> 
                form
              end)
    case Repo.transaction(delform) do
      {:ok, %{:delete => form}} ->
        {:ok, form}
      {:error, _key, change, _ops} ->
        {:error, Helpers.translate_error(change)}
      _ ->
        {:error, "Unknown operation"}
    end
  end

  def is_form_filled(repo, %{context: %{form: form}}, data) do
    {:error, "No information supplied"}
  end
end
