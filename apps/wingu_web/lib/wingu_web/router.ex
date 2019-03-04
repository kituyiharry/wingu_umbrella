defmodule WinguWeb.Router do
  use WinguWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :authenticated do
    plug WinguWeb.Authenticated
  end

  pipeline :contextualize do
    plug :fetch_session
    plug WinguWeb.Context
  end

  scope "/", WinguWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/signout",                GoogleAuthController, :delete
    get "/auth/:provider",          GoogleAuthController, :request
    get "/auth/:provider/callback", GoogleAuthController, :callback
  end


  scope "/graphiql" do
    pipe_through [:contextualize]
    forward "/", Absinthe.Plug.GraphiQL,
      schema: WinguWeb.GraphQL.Schema,
      interface: :simple
  end

  scope "/graphql" do
    forward "/",  Absinthe.Plug,
      schema: WinguWeb.GraphQL.Schema
  end

  scope "/rest", WinguWeb do
    pipe_through [:authenticated]
    resources "/companies", CompanyController, except: [:new, :edit] do
      resources "/events", EventController, except: [:new, :edit]
    end
    resources "/clients", ClientController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", WinguWeb do
  #   pipe_through :api
  # end
end
