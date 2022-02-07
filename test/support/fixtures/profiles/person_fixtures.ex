defmodule ClimateCoolers.Profiles.PersonFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Profiles.Person` context.
  """

  @doc """
  Generate a person_profile.
  """
  def person_profile_fixture(attrs \\ %{}) do
    {:ok, person_profile} =
      attrs
      |> Enum.into(%{
        birthdate: ~D[2022-02-06],
        description: "some description",
        name: "some name"
      })
      |> ClimateCoolers.Profiles.Person.create_person_profile()

    person_profile
  end
end
