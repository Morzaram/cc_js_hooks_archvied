defmodule ClimateCoolers.PersonProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.PersonProfiles` context.
  """

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ClimateCoolers.PersonProfiles.create_profile()

    profile
  end
end
