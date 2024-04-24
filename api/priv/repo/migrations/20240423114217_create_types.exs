defmodule Api.Repo.Migrations.CreateTypes do
  use Ecto.Migration

  def change do
    create table(:types, primary_key: false) do
      add :id, :id, primary_key: true
      add :description, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:types, [:id])
  end
end
