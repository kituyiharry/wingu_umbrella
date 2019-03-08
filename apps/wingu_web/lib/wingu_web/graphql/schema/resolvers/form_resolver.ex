defmodule WinguWeb.GraphQL.Resolvers.FormResolver do
  alias Wingu.{Companies, Repo, Forms, FormTemplates, SectionNodes, DescriptionNodes}
  alias WinguWeb.{GraphQL.Helpers}
  alias Ecto.Multi
  require IO

  def forms(_parent, %{company: id}, %{context: %{"sub" => _id}}) do
    company = Companies.get_company!(id) |> Repo.preload(:forms)
    #company = Companies.get_company!(id) |> Repo.preload([forms: [form_templates: [sections_nodes: [:description_nodes]]]])
    {:ok, company.forms}
  end

  def create_form(_parent, %{company: company, form: %{name: n, summary: s, description: d, template: t}}, %{context: %{"sub" => _id}}) do    
    ## Substitute to Multi format, easy to handle
    mul = Multi.new()
          |> Multi.run(:get_company, fn repo,_change -> {:ok, repo.get!(Companies.Company, company)} end)
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
            Ecto.Multi.new() 
            |> Multi.run(:template_assoc, fn _r,_c -> 
              # convert each section to a changeset
              {:ok, Enum.map(t.sections, fn sec -> 
                {sec.nodes, Ecto.build_assoc(template, :sections_nodes) |> SectionNodes.SectionNode.changeset(sec)} 
              end)} 
            end)
            |> Multi.merge(fn %{template_assoc: changesets} -> 
              # index changesets for dynamic keys
              Enum.with_index(changesets)|> Enum.reduce(Multi.new(), fn {{nodes, entry}, index}, multi ->
                key = "sections_#{index}"
                Multi.insert(multi, key, entry) 
                # Capture each new section and Merge this transaction
                |> Multi.merge(fn %{^key => section} -> 
                  dkey = "nodes_#{key}"
                  Multi.new()
                  # Convert subnodes into changesets
                  |> Multi.run(dkey, fn _r,_c -> 
                    {:ok, Enum.map(nodes, fn node -> 
                      Ecto.build_assoc(section, :description_nodes) |> DescriptionNodes.DescriptionNode.changeset(node) 
                    end)}
                  end)
                  |> Multi.merge(fn %{^dkey => changesets} ->
                    changesets |> Enum.reduce(Multi.new(), fn changeset, multi -> 
                      key = "insert_#{dkey}"
                      Multi.insert(multi, key, changeset) 
                    end)
                  end)
                end)
              end)
            end)
          end)
          |> Multi.run(:preload, fn repo, %{:form => form} -> 
            form = repo.preload(form, [form_templates: [sections_nodes: [:description_nodes]]])
            {:ok, form}
          end)
    case Repo.transaction(mul) do
      {:ok, %{:preload => form}} ->
        {:ok, form}
      {:error, _key, change, _ops} ->
        IO.inspect(change)
        {:error, Helpers.translate_error(change)}
      _ ->
        {:error, "Unknown operation"}
    end
  end

end
