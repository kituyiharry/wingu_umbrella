defmodule WinguWeb.GraphQL.Resolvers.CompanyResolver do
  alias Wingu.{Repo,Companies,Clients}
  require IO
  def create_company(_parent, _args, %{context: %Guardian.MalformedReturnValueError{}}) do
    {:error, "Not Signed in"}
  end

  def create_company(_parent, %{company_params: params, role: role, description: description}, %{context: %{"sub" => sub}}) do
    changeset = Companies.Company.changeset(%Companies.Company{},params) 
    case changeset.valid? do
      true ->
        company = Repo.insert!(changeset)
        Companies.Clients.changeset(%Companies.Clients{},%{role: role, description: description, clients_id: sub, companies_id: company.id}) |> Repo.insert!()
        {:ok, company}
      _ ->
        {:error, WinguWeb.GraphQL.Helpers.translate_error(%{errors: changeset.errors})}
    end
  end

  def my_companies(_parent, _args, %{context: %{"sub" => sub}}) do
    client = Wingu.Clients.get_client!(sub) |> Repo.preload(:companies)
    {:ok, client.companies}
  end

  def update_company(_parent, %{id: params, change: changeattrs},%{context: %{"sub" => sub}}) do
    client = Wingu.Clients.get_client!(sub) |> Repo.preload(:companies)
    case Enum.find(client.companies, fn c -> c.id === params end) do
      %Companies.Company{} = company ->
        with {:ok, %Companies.Company{} = up_company} <- Companies.update_company(company, changeattrs) do
          {:ok, up_company}
        else  
          _ -> {:error, "The item couldn't be updated"}
        end
      nil ->
        {:error, "Not found or already deleted!"}
    end
  end

  def delete(_parent, %{id: params}, %{context: %{"sub" => sub}}) do
    client = Wingu.Clients.get_client!(sub) |> Repo.preload(:companies)
    case Enum.find(client.companies, fn c -> c.id === params end) do
      %Companies.Company{} = company ->
        del = Companies.delete_company(company)
        {:ok, del}
      nil ->
        {:error, "Not found or already deleted!"}
    end
  end
end
