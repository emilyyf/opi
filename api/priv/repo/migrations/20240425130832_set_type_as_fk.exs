defmodule Api.Repo.Migrations.SetTypeAsFk do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      modify :type, references("types")
    end 
  end
end
