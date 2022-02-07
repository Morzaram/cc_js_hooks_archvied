defmodule ClimateCoolers.PersonProfilesTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.PersonProfiles

  describe "person_profiles" do
    alias ClimateCoolers.PersonProfiles.Profile

    import ClimateCoolers.PersonProfilesFixtures

    @invalid_attrs %{name: nil}

    test "list_person_profiles/0 returns all person_profiles" do
      profile = profile_fixture()
      assert PersonProfiles.list_person_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert PersonProfiles.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Profile{} = profile} = PersonProfiles.create_profile(valid_attrs)
      assert profile.name == "some name"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PersonProfiles.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Profile{} = profile} = PersonProfiles.update_profile(profile, update_attrs)
      assert profile.name == "some updated name"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = PersonProfiles.update_profile(profile, @invalid_attrs)
      assert profile == PersonProfiles.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = PersonProfiles.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> PersonProfiles.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = PersonProfiles.change_profile(profile)
    end
  end
end
