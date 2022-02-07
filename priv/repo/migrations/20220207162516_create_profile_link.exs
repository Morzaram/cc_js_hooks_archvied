defmodule ClimateCoolers.Repo.Migrations.CreateProfileLink do
  use Ecto.Migration

  def change do
    create table(:profile_link) do
      add :url, :string
      add :title, :string
      add :company_id, references(:company_profiles, on_delete: :nothing)
      add :person_id, references(:person_profiles, on_delete: :nothing)

      timestamps()
    end

    create index(:profile_link, [:company_id])
    create index(:profile_link, [:person_id])
  end
end
