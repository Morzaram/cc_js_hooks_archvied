defmodule ClimateCoolers.ProfileImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.ProfileImages` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        alt: "some alt",
        url: "some url"
      })
      |> ClimateCoolers.ProfileImages.create_image()

    image
  end
end
