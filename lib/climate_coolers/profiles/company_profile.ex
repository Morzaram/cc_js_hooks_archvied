defmodule ClimateCoolers.Profiles.CompanyProfile do
  use Ecto.Schema
  import Ecto.Changeset
  alias ClimateCoolers.Profiles.ProfileAttributes.{Image, Link}

  schema "company_profiles" do
    field :description, :string
    field :established, :date
    field :name, :string
    field :url, :string

    belongs_to :owner, ClimateCoolers.Accounts.User
    has_many :links, Link
    has_many :profile_pictures, Image

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :description, :established, :url])
    |> validate_required([:name, :description, :established, :url])
  end
end
