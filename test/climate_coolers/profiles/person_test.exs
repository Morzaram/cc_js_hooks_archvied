defmodule ClimateCoolers.Profiles.PersonTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Profiles.Person

  describe "person_profile" do
    alias ClimateCoolers.Profiles.Person.PersonProfile

    import ClimateCoolers.Profiles.PersonFixtures

    @invalid_attrs %{birthdate: nil, description: nil, name: nil}

    test "list_person_profile/0 returns all person_profile" do
      person_profile = person_profile_fixture()
      assert Person.list_person_profile() == [person_profile]
    end

    test "get_person_profile!/1 returns the person_profile with given id" do
      person_profile = person_profile_fixture()
      assert Person.get_person_profile!(person_profile.id) == person_profile
    end

    test "create_person_profile/1 with valid data creates a person_profile" do
      valid_attrs = %{birthdate: ~D[2022-02-06], description: "some description", name: "some name"}

      assert {:ok, %PersonProfile{} = person_profile} = Person.create_person_profile(valid_attrs)
      assert person_profile.birthdate == ~D[2022-02-06]
      assert person_profile.description == "some description"
      assert person_profile.name == "some name"
    end

    test "create_person_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Person.create_person_profile(@invalid_attrs)
    end

    test "update_person_profile/2 with valid data updates the person_profile" do
      person_profile = person_profile_fixture()
      update_attrs = %{birthdate: ~D[2022-02-07], description: "some updated description", name: "some updated name"}

      assert {:ok, %PersonProfile{} = person_profile} = Person.update_person_profile(person_profile, update_attrs)
      assert person_profile.birthdate == ~D[2022-02-07]
      assert person_profile.description == "some updated description"
      assert person_profile.name == "some updated name"
    end

    test "update_person_profile/2 with invalid data returns error changeset" do
      person_profile = person_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Person.update_person_profile(person_profile, @invalid_attrs)
      assert person_profile == Person.get_person_profile!(person_profile.id)
    end

    test "delete_person_profile/1 deletes the person_profile" do
      person_profile = person_profile_fixture()
      assert {:ok, %PersonProfile{}} = Person.delete_person_profile(person_profile)
      assert_raise Ecto.NoResultsError, fn -> Person.get_person_profile!(person_profile.id) end
    end

    test "change_person_profile/1 returns a person_profile changeset" do
      person_profile = person_profile_fixture()
      assert %Ecto.Changeset{} = Person.change_person_profile(person_profile)
    end
  end

  describe "person_profiles" do
    alias ClimateCoolers.Profiles.Person.PersonProfile

    import ClimateCoolers.Profiles.PersonFixtures

    @invalid_attrs %{birthdate: nil, description: nil, name: nil}

    test "list_person_profiles/0 returns all person_profiles" do
      person_profile = person_profile_fixture()
      assert Person.list_person_profiles() == [person_profile]
    end

    test "get_person_profile!/1 returns the person_profile with given id" do
      person_profile = person_profile_fixture()
      assert Person.get_person_profile!(person_profile.id) == person_profile
    end

    test "create_person_profile/1 with valid data creates a person_profile" do
      valid_attrs = %{birthdate: ~D[2022-02-06], description: "some description", name: "some name"}

      assert {:ok, %PersonProfile{} = person_profile} = Person.create_person_profile(valid_attrs)
      assert person_profile.birthdate == ~D[2022-02-06]
      assert person_profile.description == "some description"
      assert person_profile.name == "some name"
    end

    test "create_person_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Person.create_person_profile(@invalid_attrs)
    end

    test "update_person_profile/2 with valid data updates the person_profile" do
      person_profile = person_profile_fixture()
      update_attrs = %{birthdate: ~D[2022-02-07], description: "some updated description", name: "some updated name"}

      assert {:ok, %PersonProfile{} = person_profile} = Person.update_person_profile(person_profile, update_attrs)
      assert person_profile.birthdate == ~D[2022-02-07]
      assert person_profile.description == "some updated description"
      assert person_profile.name == "some updated name"
    end

    test "update_person_profile/2 with invalid data returns error changeset" do
      person_profile = person_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Person.update_person_profile(person_profile, @invalid_attrs)
      assert person_profile == Person.get_person_profile!(person_profile.id)
    end

    test "delete_person_profile/1 deletes the person_profile" do
      person_profile = person_profile_fixture()
      assert {:ok, %PersonProfile{}} = Person.delete_person_profile(person_profile)
      assert_raise Ecto.NoResultsError, fn -> Person.get_person_profile!(person_profile.id) end
    end

    test "change_person_profile/1 returns a person_profile changeset" do
      person_profile = person_profile_fixture()
      assert %Ecto.Changeset{} = Person.change_person_profile(person_profile)
    end
  end
end
