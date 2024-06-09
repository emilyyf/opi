defmodule Opi.OPI.Type do
  use Ecto.Schema
  import Ecto.Changeset

  schema "types" do
    field :description, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
