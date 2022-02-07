defmodule ClimateCoolers.Repo.Migrations.CreatePersonProfileImages do
  use Ecto.Migration

  def change do
    create table(:person_profile_images) do
      add :url, :string
      add :link_name, :string
      add :person_profile_id, references(:person_profiles, on_delete: :nothing)

      timestamps()
    end

    create index(:person_profile_images, [:person_profile_id])
  end
end
