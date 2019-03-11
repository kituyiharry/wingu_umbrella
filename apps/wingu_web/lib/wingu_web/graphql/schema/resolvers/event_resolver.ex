defmodule WinguWeb.GraphQL.Resolvers.EventResolver do
  @moduledoc """
  #######################################################################
  #                            EventResolver                            #
  #######################################################################

  @author: Harry Kituyi
  @mail: kituyiharry@gmail.com

  GraphQL Resolvers for Events
  """

  alias Wingu.{Events, Companies, Repo}
  alias WinguWeb.GraphQL.TransactionHelper
  alias Ecto.Multi

  @doc "Create an event and associates it with a company"
  def create_events(_parent, %{event_params: params, company_id: id}, %{context: %{"sub" => _sub}}) do
    new_event =
      Multi.new()
      |> Multi.run(:fetch_company, fn repo, _changes ->
        TransactionHelper.handle_fetch(repo, Companies.Company, id)
      end)
      |> Multi.insert(:insert_event, fn %{:fetch_company => company} ->
        Ecto.build_assoc(company, :events) |> Events.Event.changeset(clean(params))
      end)

    TransactionHelper.handle_transaction(new_event, :insert_event)
  end

  @doc "Returns Events associated witha company"
  def company_events(_parent, %{company_id: id}, %{context: %{"sub" => _sub}}) do
    company = Companies.get_company!(id) |> Repo.preload(:events)
    {:ok, company.events}
  end

  @doc "Updates an event with relevant information"
  def update_event(_parent, %{id: params, change: changeattrs}, %{context: %{"sub" => _sub}}) do
    up_event =
      Multi.new()
      |> Multi.run(:fetch_event, fn repo, _changes ->
        TransactionHelper.handle_fetch(repo, Events.Event, params)
      end)
      |> Multi.update(:update, fn %{:fetch_event => event} ->
        event |> Events.Event.changeset(changeattrs)
      end)

    TransactionHelper.handle_transaction(up_event, :fetch_event)
  end

  @doc "Deletes an event"
  def delete_event(_parent, %{id: params}, %{context: %{"sub" => _sub}}) do
    delevent =
      Multi.new()
      |> Multi.run(:fetch_event, fn repo, _changes ->
        TransactionHelper.handle_fetch(repo, Events.Event, params)
      end)
      |> Multi.delete(:delete_event, fn %{:fetch_event => event} ->
        event
      end)

    TransactionHelper.handle_transaction(delevent, :delete_event)
  end

  @doc false
  defp clean(%{from: _f, to: _t} = params) do
    nparams = Map.update!(params, :from, fn date -> DateTime.truncate(date, :second) end)
    fparams = Map.update!(nparams, :to, fn date -> DateTime.truncate(date, :second) end)
    fparams
  end
end
