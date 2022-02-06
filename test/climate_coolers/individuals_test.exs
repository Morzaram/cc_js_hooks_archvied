defmodule ClimateCoolers.IndividualsTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Individuals

  describe "individuals" do
    alias ClimateCoolers.Individuals.Individual

    import ClimateCoolers.IndividualsFixtures

    @invalid_attrs %{description: nil, first_name: nil, last_name: nil, pro_climate: nil}

    test "list_individuals/0 returns all individuals" do
      individual = individual_fixture()
      assert Individuals.list_individuals() == [individual]
    end

    test "get_individual!/1 returns the individual with given id" do
      individual = individual_fixture()
      assert Individuals.get_individual!(individual.id) == individual
    end

    test "create_individual/1 with valid data creates a individual" do
      valid_attrs = %{description: "some description", first_name: "some first_name", last_name: "some last_name", pro_climate: true}

      assert {:ok, %Individual{} = individual} = Individuals.create_individual(valid_attrs)
      assert individual.description == "some description"
      assert individual.first_name == "some first_name"
      assert individual.last_name == "some last_name"
      assert individual.pro_climate == true
    end

    test "create_individual/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Individuals.create_individual(@invalid_attrs)
    end

    test "update_individual/2 with valid data updates the individual" do
      individual = individual_fixture()
      update_attrs = %{description: "some updated description", first_name: "some updated first_name", last_name: "some updated last_name", pro_climate: false}

      assert {:ok, %Individual{} = individual} = Individuals.update_individual(individual, update_attrs)
      assert individual.description == "some updated description"
      assert individual.first_name == "some updated first_name"
      assert individual.last_name == "some updated last_name"
      assert individual.pro_climate == false
    end

    test "update_individual/2 with invalid data returns error changeset" do
      individual = individual_fixture()
      assert {:error, %Ecto.Changeset{}} = Individuals.update_individual(individual, @invalid_attrs)
      assert individual == Individuals.get_individual!(individual.id)
    end

    test "delete_individual/1 deletes the individual" do
      individual = individual_fixture()
      assert {:ok, %Individual{}} = Individuals.delete_individual(individual)
      assert_raise Ecto.NoResultsError, fn -> Individuals.get_individual!(individual.id) end
    end

    test "change_individual/1 returns a individual changeset" do
      individual = individual_fixture()
      assert %Ecto.Changeset{} = Individuals.change_individual(individual)
    end
  end
end
