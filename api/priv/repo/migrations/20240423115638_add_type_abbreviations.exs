defmodule Api.Repo.Migrations.AddTypeAbbreviations do
  use Ecto.Migration

  def change do
    alter table(:types) do
      add :abbreviation, :string
    end
  end
end
