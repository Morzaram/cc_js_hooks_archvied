defmodule ClimateCoolers.Repo.Migrations.CreatePersonProfiles do
  use Ecto.Migration

  def change do
    create table(:person_profiles) do
      add :name, :string

      timestamps()
    end
  end
end
