defmodule Opi.Repo.Migrations.CreateTypes do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
