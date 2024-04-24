defmodule Api.OPI.Type do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :id, autogenerate: true}
  @foreign_key_type :id
  schema "types" do
    field :description, :string
    field :abbreviation, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(type, attrs) do
    type
    |> cast(attrs, [:id, :description, :abbreviation])
    |> validate_required([:id, :description])
    |> unique_constraint(:id)
  end
end
