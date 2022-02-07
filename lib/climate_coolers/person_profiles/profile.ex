defmodule ClimateCoolers.PersonProfiles.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "person_profiles" do
    field :birthdate, :date
    field :description, :string
    field :name, :string
    field :owner_id, :id

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:name, :description, :birthdate])
    |> validate_required([:name, :description, :birthdate])
  end
end
