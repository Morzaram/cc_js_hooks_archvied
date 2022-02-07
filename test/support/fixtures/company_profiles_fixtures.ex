defmodule ClimateCoolers.CompanyProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.CompanyProfiles` context.
  """

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        description: "some description",
        established: ~D[2022-02-06],
        name: "some name",
        url: "some url"
      })
      |> ClimateCoolers.CompanyProfiles.create_profile()

    profile
  end
end
