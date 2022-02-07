defmodule ClimateCoolers.ProfileImages.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profile_images" do
    field :alt, :string
    field :url, :string
    field :person_id, :id
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:url, :alt])
    |> validate_required([:url, :alt])
  end
end
