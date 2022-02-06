defmodule ClimateCoolers.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :url, :string
      add :description, :string
      add :pro_climate, :boolean, default: false, null: false
      add :established_at, :date

      timestamps()
    end
  end
end
