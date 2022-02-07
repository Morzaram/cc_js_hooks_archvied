defmodule ClimateCoolers.Repo.Migrations.CreateProfileImages do
  use Ecto.Migration

  def change do
    create table(:company_profile_images) do
      add :url, :string
      add :link_name, :string
      add :company_profile_id, references(:company_profiles, on_delete: :nothing)

      timestamps()
    end

    create index(:company_profile_images, [:company_profile_id])
  end
end
