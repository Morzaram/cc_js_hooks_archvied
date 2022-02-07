defmodule ClimateCoolers.Profiles.Person.PersonProfile do
  use Ecto.Schema
  import Ecto.Changeset
  alias ClimateCoolers.Profiles.Person.ProfileImages.ProfileImage

  schema "person_profiles" do
    field :birthdate, :date
    field :description, :string
    field :name, :string
    field :owner_id, :id

    has_many :profile_images, ProfileImage

    timestamps()
  end

  @doc false
  def changeset(person_profile, attrs) do
    person_profile
    |> cast(attrs, [:name, :description, :birthdate])
    |> cast_assoc(:profile_images)
    |> validate_required([:name, :description, :birthdate])
  end
end
