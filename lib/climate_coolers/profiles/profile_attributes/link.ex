defmodule ClimateCoolers.Profiles.ProfileAttributes.Link do
  use Ecto.Schema
  import Ecto.Changeset

  alias ClimateCoolers.Profiles.{CompanyProfile, PersonProfile}

  schema "profile_link" do
    field :title, :string
    field :url, :string

    belongs_to :person_profile, PersonProfile
    belongs_to :company_profile, CompanyProfile

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url, :title])
    |> validate_required([:url, :title])
  end
end
