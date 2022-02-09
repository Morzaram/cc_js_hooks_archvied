defmodule ClimateCoolers.Repo.Migrations.CreateProfileImages do
  use Ecto.Migration

  def change do
    create table(:profile_images) do
      add :url, :string
      add :alt, :string
      add :person_profile_id, references(:person_profiles, on_delete: :nothing)
      add :company_profile_id, references(:company_profiles, on_delete: :nothing)

      timestamps()
    end

    create index(:profile_images, [:person_profile_id])
    create index(:profile_images, [:company_profile_id])
  end
end
