defmodule ClimateCoolers.PersonProfiles.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  alias ClimateCoolers.ProfileImages.Image
  alias ClimateCoolers.ProfileLink.Link

  schema "person_profiles" do
    field :birthdate, :date
    field :description, :string
    field :name, :string

    belongs_to :owner, ClimateCoolers.Accounts.User
    has_many :links, Link
    has_many :pics, Image

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :description, :birthdate])
    |> validate_required([:name, :description, :birthdate])
  end
end
