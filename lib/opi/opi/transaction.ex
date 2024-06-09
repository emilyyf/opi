defmodule Opi.OPI.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :date, :naive_datetime
    field :description, :string
    field :months, :integer
    field :value, :integer
    field :account_id, :id
    field :type_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:description, :date, :value, :months])
    |> validate_required([:description, :date, :value, :months])
  end
end
