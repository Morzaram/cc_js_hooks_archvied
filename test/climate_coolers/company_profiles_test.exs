defmodule ClimateCoolers.CompanyProfilesTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.CompanyProfiles

  describe "company_profiles" do
    alias ClimateCoolers.CompanyProfiles.CompanyProfile

    import ClimateCoolers.CompanyProfilesFixtures

    @invalid_attrs %{name: nil}

    test "list_company_profiles/0 returns all company_profiles" do
      company_profile = company_profile_fixture()
      assert CompanyProfiles.list_company_profiles() == [company_profile]
    end

    test "get_company_profile!/1 returns the company_profile with given id" do
      company_profile = company_profile_fixture()
      assert CompanyProfiles.get_company_profile!(company_profile.id) == company_profile
    end

    test "create_company_profile/1 with valid data creates a company_profile" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %CompanyProfile{} = company_profile} = CompanyProfiles.create_company_profile(valid_attrs)
      assert company_profile.name == "some name"
    end

    test "create_company_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CompanyProfiles.create_company_profile(@invalid_attrs)
    end

    test "update_company_profile/2 with valid data updates the company_profile" do
      company_profile = company_profile_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %CompanyProfile{} = company_profile} = CompanyProfiles.update_company_profile(company_profile, update_attrs)
      assert company_profile.name == "some updated name"
    end

    test "update_company_profile/2 with invalid data returns error changeset" do
      company_profile = company_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = CompanyProfiles.update_company_profile(company_profile, @invalid_attrs)
      assert company_profile == CompanyProfiles.get_company_profile!(company_profile.id)
    end

    test "delete_company_profile/1 deletes the company_profile" do
      company_profile = company_profile_fixture()
      assert {:ok, %CompanyProfile{}} = CompanyProfiles.delete_company_profile(company_profile)
      assert_raise Ecto.NoResultsError, fn -> CompanyProfiles.get_company_profile!(company_profile.id) end
    end

    test "change_company_profile/1 returns a company_profile changeset" do
      company_profile = company_profile_fixture()
      assert %Ecto.Changeset{} = CompanyProfiles.change_company_profile(company_profile)
    end
  end

  describe "company_profiles" do
    alias ClimateCoolers.CompanyProfiles.Profile

    import ClimateCoolers.CompanyProfilesFixtures

    @invalid_attrs %{name: nil}

    test "list_company_profiles/0 returns all company_profiles" do
      profile = profile_fixture()
      assert CompanyProfiles.list_company_profiles() == [profile]
    end

    test "get_profile!/1 returns the profile with given id" do
      profile = profile_fixture()
      assert CompanyProfiles.get_profile!(profile.id) == profile
    end

    test "create_profile/1 with valid data creates a profile" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Profile{} = profile} = CompanyProfiles.create_profile(valid_attrs)
      assert profile.name == "some name"
    end

    test "create_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CompanyProfiles.create_profile(@invalid_attrs)
    end

    test "update_profile/2 with valid data updates the profile" do
      profile = profile_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Profile{} = profile} = CompanyProfiles.update_profile(profile, update_attrs)
      assert profile.name == "some updated name"
    end

    test "update_profile/2 with invalid data returns error changeset" do
      profile = profile_fixture()
      assert {:error, %Ecto.Changeset{}} = CompanyProfiles.update_profile(profile, @invalid_attrs)
      assert profile == CompanyProfiles.get_profile!(profile.id)
    end

    test "delete_profile/1 deletes the profile" do
      profile = profile_fixture()
      assert {:ok, %Profile{}} = CompanyProfiles.delete_profile(profile)
      assert_raise Ecto.NoResultsError, fn -> CompanyProfiles.get_profile!(profile.id) end
    end

    test "change_profile/1 returns a profile changeset" do
      profile = profile_fixture()
      assert %Ecto.Changeset{} = CompanyProfiles.change_profile(profile)
    end
  end
end
