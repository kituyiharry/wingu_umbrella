defmodule WinguWeb.GraphQL.Resolvers.CompanyResolver do
  alias Wingu.{Repo,Companies}
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
end
