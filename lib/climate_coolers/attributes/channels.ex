defmodule ClimateCoolers.Attributes.Channels do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channel" do
    field :name, :string
    field :url, :string
    field :individual_id, :id
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(channels, attrs) do
    channels
    |> cast(attrs, [:name, :url])
    |> validate_required([:name, :url])
  end
end
