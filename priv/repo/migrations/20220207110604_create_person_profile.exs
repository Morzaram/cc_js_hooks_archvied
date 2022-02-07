defmodule ClimateCoolers.Repo.Migrations.CreatePersonProfile do
  use Ecto.Migration

  def change do
    create table(:person_profile) do
      add :name, :string
      add :description, :text
      add :birthdate, :date
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:person_profile, [:owner_id])
  end
end
