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
  end

  scope "/", WinguWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", WinguWeb do
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
