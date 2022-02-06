defmodule ClimateCoolers.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :description, :string
    field :established_at, :date
    field :name, :string
    field :pro_climate, :boolean, default: false
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :url, :description, :pro_climate, :established_at])
    |> validate_required([:name, :url, :description, :pro_climate, :established_at])
  end
end
