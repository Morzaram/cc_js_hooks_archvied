defmodule ClimateCoolers.Repo.Migrations.CreateIndividuals do
  use Ecto.Migration

  def change do
    create table(:individuals) do
      add :first_name, :string
      add :last_name, :string
      add :description, :string
      add :pro_climate, :boolean, default: false, null: false

      timestamps()
    end
  end
end
