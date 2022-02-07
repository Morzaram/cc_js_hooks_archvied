defmodule ClimateCoolers.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :url, :string
      add :description, :text
      add :established_in, :date
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:companies, [:owner_id])
  end
end
