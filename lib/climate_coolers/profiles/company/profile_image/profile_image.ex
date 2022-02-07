defmodule ClimateCoolers.Profiles.ProfileImages.ProfileImage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "company_profile_images" do
    field :link_name, :string
    field :url, :string
    field :company_profile_id, :id

    timestamps()
  end

  @doc false
  def changeset(company_profile_image, attrs) do
    company_profile_image
    |> cast(attrs, [:url, :link_name])
    |> validate_required([:url, :link_name])
  end
end
