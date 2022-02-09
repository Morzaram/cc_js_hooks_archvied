defmodule ClimateCoolers.Profiles.CompanyRegistration do
  use Ecto.Schema
  import Ecto.Changeset
  alias ClimateCoolers.Profiles.CompanyRegistration

  embedded_schema do
  end

  @doc false
  def changeset(%CompanyRegistration{} = company_registration, attrs) do
    company_registration
    |> cast(attrs, [])
    |> validate_required([])
  end
end
