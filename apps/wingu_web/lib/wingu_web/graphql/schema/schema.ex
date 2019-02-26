defmodule WinguWeb.GraphQL.Schema do
  use Absinthe.Schema

  import_types WinguWeb.GraphQL.Schema.Types
  query do
    #Fields go here
     field :item, :item do
      arg :id, non_null(:id)
      resolve fn %{id: _item_id}, _ ->
        {:ok, %{name: 1, id: 1}}
      end
    end
  end
end
