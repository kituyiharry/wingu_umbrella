defmodule WinguWeb.GraphQL.Resolvers.DocumentClassResolver do  

  alias Ecto.Multi
  alias Wingu.{DocumentClasses, Companies}
  alias WinguWeb.GraphQL.TransactionHelper

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
end
