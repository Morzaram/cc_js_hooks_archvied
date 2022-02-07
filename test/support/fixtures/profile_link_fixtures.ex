defmodule ClimateCoolers.ProfileLinkFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.ProfileLink` context.
  """

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        title: "some title",
        url: "some url"
      })
      |> ClimateCoolers.ProfileLink.create_link()

    link
  end
end
