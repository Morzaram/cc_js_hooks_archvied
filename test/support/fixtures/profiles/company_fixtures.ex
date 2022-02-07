defmodule ClimateCoolers.Profiles.CompanyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Profiles.Company` context.
  """

  @doc """
  Generate a company_profile.
  """
  def company_profile_fixture(attrs \\ %{}) do
    {:ok, company_profile} =
      attrs
      |> Enum.into(%{
        description: "some description",
        established_in: ~D[2022-02-06],
        name: "some name",
        url: "some url"
      })
      |> ClimateCoolers.Profiles.Company.create_company_profile()

    company_profile
  end
end
