defmodule ClimateCoolers.Repo.Migrations.CreatePersonProfiles do
  use Ecto.Migration

  def change do
    create table(:person_profiles) do
      add :name, :string
      add :description, :string
      add :birthdate, :date
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:person_profiles, [:owner_id])
  end
end
