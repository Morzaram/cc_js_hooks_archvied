defmodule ClimateCoolers.ProfileLink.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profile_link" do
    field :title, :string
    field :url, :string
    field :company_id, :id
    field :person_id, :id

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url, :title])
    |> validate_required([:url, :title])
  end
end
