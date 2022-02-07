defmodule ClimateCoolers.Repo.Migrations.CreateCompanyProfiles do
  use Ecto.Migration

  def change do
    create table(:company_profiles) do
      add :name, :string
      add :url, :string
      add :description, :text
      add :established_in, :date
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:company_profiles, [:owner_id])
  end
end
