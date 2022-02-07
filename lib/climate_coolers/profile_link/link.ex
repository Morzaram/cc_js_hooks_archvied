defmodule ClimateCoolers.ProfileLink.Link do
  use Ecto.Schema
  import Ecto.Changeset

  alias ClimateCoolers.PersonProfiles
  alias ClimateCoolers.CompanyProfiles

  schema "profile_link" do
    field :title, :string
    field :url, :string
    field :company_id, :id
    field :person_id, :id

    belongs_to :person_profile, PersonProfiles.Profile
    belongs_to :company_profile, CompanyProfiles.Profile

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url, :title])
    |> validate_required([:url, :title])
  end
end
