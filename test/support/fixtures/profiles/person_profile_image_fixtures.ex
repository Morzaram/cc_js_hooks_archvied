defmodule ClimateCoolers.Profiles.PersonProfileImageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Profiles.PersonProfileImage` context.
  """

  @doc """
  Generate a person_profile_image.
  """
  def person_profile_image_fixture(attrs \\ %{}) do
    {:ok, person_profile_image} =
      attrs
      |> Enum.into(%{
        link_name: "some link_name",
        url: "some url"
      })
      |> ClimateCoolers.Profiles.PersonProfileImage.create_person_profile_image()

    person_profile_image
  end
end
