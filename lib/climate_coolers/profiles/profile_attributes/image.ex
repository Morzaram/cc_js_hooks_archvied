defmodule ClimateCoolers.Profiles.ProfileAttributes.Image do
  use Ecto.Schema
  import Ecto.Changeset

  alias ClimateCoolers.Profiles.{PersonProfile, CompanyProfile}

  schema "profile_images" do
    field(:alt, :string)
    field(:url, :string)

    belongs_to(:person_profile, PersonProfile)
    belongs_to(:company_profile, CompanyProfile)
    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:url, :alt])
    |> validate_required([:url, :alt])
  end
end
