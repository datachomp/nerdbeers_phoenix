defmodule Nerdbeers.Router do
  use Nerdbeers.Web, :router

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

  scope "/", Nerdbeers do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show

    resources "/agenda", AgendaController
    resources "/suggestions", SuggestionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Nerdbeers do
  #   pipe_through :api
  # end
end
