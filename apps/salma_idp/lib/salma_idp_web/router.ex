defmodule SalmaIdpWeb.Router do
  use SalmaIdpWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SalmaIdpWeb do
    pipe_through :api
  end
end
