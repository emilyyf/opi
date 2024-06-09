defmodule OpiWeb.Router do
  use OpiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OpiWeb do
    pipe_through :api
    resources "/transactions", TransactionController
    resources "/accounts", AccountController
    resources "/types", TypeController
  end
end
