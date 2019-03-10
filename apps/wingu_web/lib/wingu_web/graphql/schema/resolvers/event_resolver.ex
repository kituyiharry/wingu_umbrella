defmodule WinguWeb.GraphQL.Resolvers.EventResolver do   

  alias Wingu.{Events, Companies, Repo}
  alias WinguWeb.GraphQL.Helpers
  alias Ecto.Multi
  require IO

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

  def create_events(_parent, %{event_params: params, company_id: id}, %{context: %{"sub" => _sub}}) do
    new_event = Multi.new()
                |> Multi.run(:fetch_company, fn repo, _changes -> 
                  handle_fetch(repo, Companies.Company, id)
                end)
                |> Multi.insert(:insert_event, fn %{:fetch_company => company} -> 
                  Ecto.build_assoc(company, :events) |> Events.Event.changeset(clean(params))
                end)
    handle_transaction(new_event, :insert_event)
  end

  def company_events(_parent, %{company_id: id}, %{context: %{"sub" => _sub}}) do
    company = Companies.get_company!(id) |> Repo.preload(:events)    
    {:ok, company.events}
  end

  def update_event(_parent, %{id: params, change: changeattrs},%{context: %{"sub" => _sub}}) do
    up_event = Multi.new()
               |> Multi.run(:fetch_event, fn repo, _changes -> 
                 handle_fetch(repo, Events.Event, params)
               end)
               |> Multi.update(:update, fn %{:fetch_event => event} -> 
                 event |> Events.Event.changeset(changeattrs)
               end)
    handle_transaction(up_event, :fetch_event)
  end

  def delete_event(_parent, %{id: params}, %{context: %{"sub" => _sub}}) do
    delevent = Multi.new()
               |> Multi.run(:fetch_event, fn repo, _changes -> 
                 handle_fetch(repo, Events.Event, params)
               end)
               |> Multi.delete(:delete_event, fn %{:fetch_event => event} -> 
                 event
               end)
    handle_transaction(delevent, :delete_event)
  end

  defp clean(%{from: _f, to: _t} = params) do
    nparams = Map.update!(params,  :from, fn date -> DateTime.truncate(date, :second) end)
    fparams = Map.update!(nparams, :to,   fn date -> DateTime.truncate(date, :second) end)
    fparams
  end
end
