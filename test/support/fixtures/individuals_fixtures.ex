defmodule ClimateCoolers.IndividualsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Individuals` context.
  """

  @doc """
  Generate a individual.
  """
  def individual_fixture(attrs \\ %{}) do
    {:ok, individual} =
      attrs
      |> Enum.into(%{
        description: "some description",
        first_name: "some first_name",
        last_name: "some last_name",
        pro_climate: true
      })
      |> ClimateCoolers.Individuals.create_individual()

    individual
  end
end
