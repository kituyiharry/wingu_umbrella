defmodule WinguWeb.GraphQL.Resolvers.EventResolver do   
  alias Wingu.{Events, Companies, Repo}
  require IO
  def create_events(_parent, %{event_params: params, company_id: id}, %{context: %{"sub" => _sub}}) do
    company = Companies.get_company!(id)
    event = Ecto.build_assoc(company, :events, clean(params)) |> Repo.insert!() 
    {:ok, event}
  end

  def company_events(_parent, %{company_id: id}, %{context: %{"sub" => _sub}}) do
    company = Companies.get_company!(id) |> Repo.preload(:events)    
    {:ok, company.events}
  end

  def update_event(_parent, %{id: params, change: changeattrs},%{context: %{"sub" => _sub}}) do
    event = Events.get_event!(params)
    with {:ok, %Events.Event{} = up_event} <- Events.update_event(event, changeattrs) do
      {:ok, up_event}
    else  
      _ -> {:error, "The item couldn't be updated"}
    end
  end

  def delete_event(_parent, %{id: params}, %{context: %{"sub" => _sub}}) do
    event = Events.get_event!(params)
    case Events.delete_event(event) do
      {:ok, ev} -> {:ok, ev}
      _ -> {:error, "Already deleted or Didn't work!"}
    end
  end

  defp clean(%{from: _f, to: _t} = params) do
    nparams = Map.update!(params,  :from, fn date -> DateTime.truncate(date, :second) end)
    fparams = Map.update!(nparams, :to,   fn date -> DateTime.truncate(date, :second) end)
    fparams
  end
end
