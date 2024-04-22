defmodule Api.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :description, :string
      add :date, :naive_datetime
      add :amount, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
