defmodule ClimateCoolers.Repo.Migrations.CreateCompanyProfiles do
  use Ecto.Migration

  def change do
    create table(:company_profiles) do
      add :name, :string

      timestamps()
    end
  end
end
