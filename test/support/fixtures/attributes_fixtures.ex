defmodule ClimateCoolers.AttributesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Attributes` context.
  """

  @doc """
  Generate a channels.
  """
  def channels_fixture(attrs \\ %{}) do
    {:ok, channels} =
      attrs
      |> Enum.into(%{
        name: "some name",
        url: "some url"
      })
      |> ClimateCoolers.Attributes.create_channels()

    channels
  end
end
