defmodule ClimateCoolers.PersonProfiles.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "person_profiles" do
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
