defmodule WinguWeb.GraphQL.Resolvers.DocumentClassResolver do  

  alias Ecto.Multi
  alias Wingu.{Repo, DocumentClasses, Companies}
  alias WinguWeb.GraphQL.TransactionHelper

  import Ecto.Query

  def create_doc_class(_parent, %{company: company, name: n, description: d}, _context) do
    docclass = Multi.new()
               |> Multi.run(:get_company, fn repo, _changes ->  
                 TransactionHelper.handle_fetch(repo, Companies.Company, company)
               end)
               |> Multi.insert(:insert_doc_class, fn %{get_company: company} -> 
                 Ecto.build_assoc(company, :document_classes)
                 |> DocumentClasses.DocumentClass.changeset(%{classname: n, class_description: d})
               end)
    TransactionHelper.handle_transaction(docclass, :insert_doc_class)
  end

  def get_doc_classes(_parent, %{company_id: id}, _context) do
    document_classes = from(
      docclass in DocumentClasses.DocumentClass,
      where: docclass.companies_id == ^id,
      select: docclass
    ) |> Repo.all()
    {:ok, document_classes}
  end

  def docclassinfo(_parent, %{id: id}, _context) do
    case Repo.get(DocumentClasses.DocumentClass, id) do
      %DocumentClasses.DocumentClass{} = doc -> {:ok, doc}
      _ -> {:error, "Not found"}
    end
  end

end
