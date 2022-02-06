defmodule ClimateCoolers.Repo.Migrations.CreateChannel do
  use Ecto.Migration

  def change do
    create table(:channel) do
      add :name, :string
      add :url, :string
      add :individual_id, references(:individuals, on_delete: :nothing)
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps()
    end

    create index(:channel, [:individual_id])
    create index(:channel, [:company_id])
  end
end
