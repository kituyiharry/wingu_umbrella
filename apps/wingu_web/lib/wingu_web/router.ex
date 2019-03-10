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
      socket: WinguWeb.UserSocket,
      interface: :simple
  end

  scope "/graphql" do
    forward "/",  Absinthe.Plug,
      schema: WinguWeb.GraphQL.Schema,
      socket: WinguWeb.UserSocket
  end

  @doc """
  Deprecated in favor of GraphQL Api, but relevant files are backed up
  `ex
  scope "/rest", WinguWeb do
    if Mix.env() in [:dev , :prod] do
      pipe_through [:authenticated]
    end
    resources "/companies", CompanyController, except: [:new, :edit] do
      resources "/events", EventController, except: [:new, :edit]
      resources "/forms", FormController, except: [:new, :edit] do
        resources "/form_data", FormDatumController, except: [:new, :edit] do
          resources "/section_data", SectionDatumController, except: [:new, :edit] do
            resources "/text_node_data", TextNodeDatumController, except: [:new, :edit]
          end
        end
        resources "/form_templates", FormTemplateController, except: [:new, :edit] do
          resources "/section_nodes", SectionNodeController, except: [:new, :edit] do
            resources "/description_nodes", DescriptionNodeController, except: [:new, :edit]
          end
        end
      end
    end
    resources "/clients", ClientController, except: [:new, :edit]
  end
  """

  # Other scopes may use custom stacks.
  # scope "/api", WinguWeb do
  #   pipe_through :api
  # end
end
