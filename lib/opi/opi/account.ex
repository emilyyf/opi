defmodule Opi.OPI.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :bank, :string
    field :close_date, :naive_datetime
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:name, :bank, :close_date])
    |> validate_required([:name, :bank, :close_date])
  end
end
