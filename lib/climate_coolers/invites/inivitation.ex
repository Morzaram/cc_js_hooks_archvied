defmodule ClimateCoolers.Invites.Inivitation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invitations" do
    field :invite_token, :string
    field :sender_id, :id
    field :receiver_id, :id

    timestamps()
  end

  @doc false
  def changeset(inivitation, attrs) do
    inivitation
    |> cast(attrs, [:invite_token])
    |> validate_required([:invite_token])
  end
end
