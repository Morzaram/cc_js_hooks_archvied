defmodule ClimateCoolers.ProfileImages.Image do
  use Ecto.Schema
  import Ecto.Changeset

  alias ClimateCoolers.PersonProfiles
  alias ClimateCoolers.CompanyProfiles

  schema "profile_images" do
    field :alt, :string
    field :url, :string

    belongs_to :person_profile, PersonProfiles.Profile
    belongs_to :company_profile, CompanyProfiles.Profile
    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:url, :alt])
    |> validate_required([:url, :alt])
  end
end
