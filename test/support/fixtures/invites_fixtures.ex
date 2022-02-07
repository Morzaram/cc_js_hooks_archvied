defmodule ClimateCoolers.InvitesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Invites` context.
  """

  @doc """
  Generate a inivitation.
  """
  def inivitation_fixture(attrs \\ %{}) do
    {:ok, inivitation} =
      attrs
      |> Enum.into(%{
        invite_token: "some invite_token"
      })
      |> ClimateCoolers.Invites.create_inivitation()

    inivitation
  end
end
