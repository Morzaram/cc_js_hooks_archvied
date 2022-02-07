defmodule ClimateCoolers.CompanyProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.CompanyProfiles` context.
  """

  @doc """
  Generate a company_profile.
  """
  def company_profile_fixture(attrs \\ %{}) do
    {:ok, company_profile} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ClimateCoolers.CompanyProfiles.create_company_profile()

    company_profile
  end

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ClimateCoolers.CompanyProfiles.create_profile()

    profile
  end
end
