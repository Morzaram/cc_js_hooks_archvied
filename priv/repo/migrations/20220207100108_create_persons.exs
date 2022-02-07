defmodule ClimateCoolers.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :name, :string
      add :description, :text
      add :birthdate, :date
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:persons, [:owner_id])
  end
end
