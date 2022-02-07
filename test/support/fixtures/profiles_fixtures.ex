defmodule ClimateCoolers.ProfilesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Profiles` context.
  """

  @doc """
  Generate a person_profile.
  """
  def person_profile_fixture(attrs \\ %{}) do
    {:ok, person_profile} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> ClimateCoolers.Profiles.create_person_profile()

    person_profile
  end
end
