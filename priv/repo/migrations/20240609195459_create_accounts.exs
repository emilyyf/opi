defmodule Opi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :bank, :string
      add :close_date, :naive_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
