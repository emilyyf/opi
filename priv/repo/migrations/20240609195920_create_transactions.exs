defmodule Opi.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :description, :string
      add :date, :naive_datetime
      add :value, :integer
      add :months, :integer
      add :account_id, references(:accounts, on_delete: :nothing)
      add :type_id, references(:types, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:transactions, [:account_id])
    create index(:transactions, [:type_id])
  end
end
