defmodule ClimateCoolers.Profiles.Company.CompanyProfile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "company_profiles" do
    field :description, :string
    field :established_in, :date
    field :name, :string
    field :url, :string
    field :owner_id, :id

    timestamps()
  end

  @doc false
  def changeset(company_profile, attrs) do
    company_profile
    |> cast(attrs, [:name, :url, :description, :established_in])
    |> validate_required([:name, :url, :description, :established_in])
  end
end
