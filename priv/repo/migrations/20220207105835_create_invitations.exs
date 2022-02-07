defmodule ClimateCoolers.Repo.Migrations.CreateInvitations do
  use Ecto.Migration

  def change do
    create table(:invitations) do
      add :invite_token, :string
      add :sender_id, references(:users, on_delete: :nothing)
      add :receiver_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:invitations, [:sender_id])
    create index(:invitations, [:receiver_id])
  end
end
