defmodule Api.OPI.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "transactions" do
    field :amount, :integer
    field :date, :naive_datetime
    field :description, :string
    field :type, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:description, :date, :amount, :type])
    |> validate_required([:description, :date, :amount, :type])
  end
end
