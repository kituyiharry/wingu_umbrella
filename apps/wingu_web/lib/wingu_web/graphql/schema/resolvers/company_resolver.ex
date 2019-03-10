defmodule WinguWeb.GraphQL.Resolvers.CompanyResolver do
  alias Wingu.{Repo,Companies}
  alias WinguWeb.GraphQL.Helpers
  alias Ecto.Multi

  defp handle_fetch(repo, module, id) do
    case repo.get(module, id) do
      %^module{} = model ->
        {:ok, model}
      nil -> 
        {:error, "A struct couldn't be found"}
      _ ->
        {:error, "Unknown error"}
    end
  end

  defp handle_transaction(multi, key) do
    case Repo.transaction(multi) do
      {:ok, match} ->
        {:ok, Map.get(match, key)}
      {:error, _key, change, _ops} ->
        {:error, Helpers.translate_error(change)}
      _ ->
        {:error, "Unknown operation"}
    end
  end

  def create_company(_parent, %{company_params: params, role: role, description: description}, %{context: %{"sub" => sub}}) do
    company = Multi.new()
              |> Multi.insert(:company, fn _ -> 
                Companies.Company.changeset(%Companies.Company{}, params)
              end)
              |> Multi.insert(:companies_clients, fn %{:company => comp} -> 
                Companies.Clients.changeset(%Companies.Clients{},%{role: role, description: description, clients_id: sub, companies_id: comp.id})
              end)
    handle_transaction(company, :company)
  end

  def my_companies(_parent, _args, %{context: %{"sub" => sub}}) do
    client = Wingu.Clients.get_client!(sub) |> Repo.preload(:companies)
    {:ok, client.companies}
  end

  def update_company(_parent, %{id: params, change: changeattrs},%{context: %{"sub" => _sub}}) do
    up_company = Multi.new()
                 |> Multi.run(:get_company, fn repo, _changes -> 
                   #repo.get!(Companies.Company, params)
                   handle_fetch(repo, Companies.Company, params)
                 end)
                 |> Multi.update(:update_company, fn %{:get_company => company} -> 
                   company |> Ecto.Changeset.change(changeattrs)
                 end)
    handle_transaction(up_company, :update_company)
  end

  def delete(_parent, %{id: params}, %{context: %{"sub" => _sub}}) do
    delcomp = Multi.new()
              |> Multi.run(:fetch, fn repo, _changes -> 
                case repo.get(Companies.Company, params) do
                  %Companies.Company{} = company -> 
                    {:ok, company}
                  _ ->
                    {:error, "Unable to find company"}
                end
              end)
              |> Multi.delete(:delete_company, fn %{fetch: fetch} -> 
                fetch
              end)
    handle_transaction(delcomp, :delete_company)
  end
end
