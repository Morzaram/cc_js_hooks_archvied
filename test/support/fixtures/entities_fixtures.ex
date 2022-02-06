defmodule ClimateCoolers.EntitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ClimateCoolers.Entities` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{
        description: "some description",
        established_at: ~D[2022-02-05],
        name: "some name",
        pro_climate: true,
        url: "some url"
      })
      |> ClimateCoolers.Entities.create_company()

    company
  end
end
