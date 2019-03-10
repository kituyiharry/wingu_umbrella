defmodule WinguWeb.GraphQL.Resolvers.CompanyResolver do
  alias Wingu.{Repo,Companies}
  alias WinguWeb.GraphQL.TransactionHelper
  alias Ecto.Multi


  def create_company(_parent, %{company_params: params, role: role, description: description}, %{context: %{"sub" => sub}}) do
    company = Multi.new()
              |> Multi.insert(:company, fn _ -> 
                Companies.Company.changeset(%Companies.Company{}, params)
              end)
              |> Multi.insert(:companies_clients, fn %{:company => comp} -> 
                Companies.Clients.changeset(%Companies.Clients{},%{role: role, description: description, clients_id: sub, companies_id: comp.id})
              end)
    TransactionHelper.handle_transaction(company, :company)
  end

  def my_companies(_parent, _args, %{context: %{"sub" => sub}}) do
    client = Wingu.Clients.get_client!(sub) |> Repo.preload(:companies)
    {:ok, client.companies}
  end

  def update_company(_parent, %{id: params, change: changeattrs},%{context: %{"sub" => _sub}}) do
    up_company = Multi.new()
                 |> Multi.run(:get_company, fn repo, _changes -> 
                   #repo.get!(Companies.Company, params)
                   TransactionHelper.handle_fetch(repo, Companies.Company, params)
                 end)
                 |> Multi.update(:update_company, fn %{:get_company => company} -> 
                   company |> Ecto.Changeset.change(changeattrs)
                 end)
    TransactionHelper.handle_transaction(up_company, :update_company)
  end

  def delete(_parent, %{id: params}, %{context: %{"sub" => _sub}}) do
    delcomp = Multi.new()
              |> Multi.run(:fetch, fn repo, _changes -> 
                TransactionHelper.handle_fetch(repo, Companies.Company, params)
              end)
              |> Multi.delete(:delete_company, fn %{fetch: fetch} -> 
                fetch
              end)
    TransactionHelper.handle_transaction(delcomp, :delete_company)
  end
end
