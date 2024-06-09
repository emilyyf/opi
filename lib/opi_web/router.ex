defmodule OpiWeb.Router do
  use OpiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OpiWeb do
    pipe_through :api
  end
end
