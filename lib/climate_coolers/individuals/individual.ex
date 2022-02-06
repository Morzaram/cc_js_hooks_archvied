defmodule ClimateCoolers.Individuals.Individual do
  use Ecto.Schema
  import Ecto.Changeset

  schema "individuals" do
    field :description, :string
    field :first_name, :string
    field :last_name, :string
    field :pro_climate, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(individual, attrs) do
    individual
    |> cast(attrs, [:first_name, :last_name, :description, :pro_climate])
    |> validate_required([:first_name, :last_name, :description, :pro_climate])
  end
end
