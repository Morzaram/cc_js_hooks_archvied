defmodule ClimateCoolers.Profiles.ProfileImageFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Profiles.ProfileImage` context.
  """

  @doc """
  Generate a company_profile_image.
  """
  def company_profile_image_fixture(attrs \\ %{}) do
    {:ok, company_profile_image} =
      attrs
      |> Enum.into(%{
        link_name: "some link_name",
        url: "some url"
      })
      |> ClimateCoolers.Profiles.ProfileImage.create_company_profile_image()

    company_profile_image
  end
end
