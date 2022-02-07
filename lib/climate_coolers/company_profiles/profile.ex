defmodule ClimateCoolers.CompanyProfiles.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "company_profiles" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
