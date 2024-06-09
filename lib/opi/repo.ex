defmodule Opi.Repo do
  use Ecto.Repo,
    otp_app: :opi,
    adapter: Ecto.Adapters.Postgres
end
