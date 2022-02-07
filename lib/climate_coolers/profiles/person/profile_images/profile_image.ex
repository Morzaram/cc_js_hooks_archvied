defmodule ClimateCoolers.Profiles.Person.ProfileImages.ProfileImage do
  use Ecto.Schema
  import Ecto.Changeset
  alias ClimateCoolers.Profiles.Person.PersonProfile

  schema "person_profile_images" do
    field :link_name, :string
    field :url, :string
    belongs_to :person_profile, PersonProfile
    timestamps()
  end

  @doc false
  def changeset(person_profile_image, attrs) do
    person_profile_image
    |> cast(attrs, [:url, :link_name])
    |> validate_required([:url, :link_name])
  end
end
