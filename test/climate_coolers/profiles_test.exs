defmodule ClimateCoolers.ProfilesTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Profiles

  describe "profile_images" do
    alias ClimateCoolers.Profiles.Images

    import ClimateCoolers.ProfilesFixtures

    @invalid_attrs %{alt: nil, url: nil}

    test "list_profile_images/0 returns all profile_images" do
      images = images_fixture()
      assert Profiles.list_profile_images() == [images]
    end

    test "get_images!/1 returns the images with given id" do
      images = images_fixture()
      assert Profiles.get_images!(images.id) == images
    end

    test "create_images/1 with valid data creates a images" do
      valid_attrs = %{alt: "some alt", url: "some url"}

      assert {:ok, %Images{} = images} = Profiles.create_images(valid_attrs)
      assert images.alt == "some alt"
      assert images.url == "some url"
    end

    test "create_images/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profiles.create_images(@invalid_attrs)
    end

    test "update_images/2 with valid data updates the images" do
      images = images_fixture()
      update_attrs = %{alt: "some updated alt", url: "some updated url"}

      assert {:ok, %Images{} = images} = Profiles.update_images(images, update_attrs)
      assert images.alt == "some updated alt"
      assert images.url == "some updated url"
    end

    test "update_images/2 with invalid data returns error changeset" do
      images = images_fixture()
      assert {:error, %Ecto.Changeset{}} = Profiles.update_images(images, @invalid_attrs)
      assert images == Profiles.get_images!(images.id)
    end

    test "delete_images/1 deletes the images" do
      images = images_fixture()
      assert {:ok, %Images{}} = Profiles.delete_images(images)
      assert_raise Ecto.NoResultsError, fn -> Profiles.get_images!(images.id) end
    end

    test "change_images/1 returns a images changeset" do
      images = images_fixture()
      assert %Ecto.Changeset{} = Profiles.change_images(images)
    end
  end

  describe "person_profiles" do
    alias ClimateCoolers.Profiles.PersonProfile

    import ClimateCoolers.ProfilesFixtures

    @invalid_attrs %{name: nil}

    test "list_person_profiles/0 returns all person_profiles" do
      person_profile = person_profile_fixture()
      assert Profiles.list_person_profiles() == [person_profile]
    end

    test "get_person_profile!/1 returns the person_profile with given id" do
      person_profile = person_profile_fixture()
      assert Profiles.get_person_profile!(person_profile.id) == person_profile
    end

    test "create_person_profile/1 with valid data creates a person_profile" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %PersonProfile{} = person_profile} = Profiles.create_person_profile(valid_attrs)
      assert person_profile.name == "some name"
    end

    test "create_person_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profiles.create_person_profile(@invalid_attrs)
    end

    test "update_person_profile/2 with valid data updates the person_profile" do
      person_profile = person_profile_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %PersonProfile{} = person_profile} = Profiles.update_person_profile(person_profile, update_attrs)
      assert person_profile.name == "some updated name"
    end

    test "update_person_profile/2 with invalid data returns error changeset" do
      person_profile = person_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Profiles.update_person_profile(person_profile, @invalid_attrs)
      assert person_profile == Profiles.get_person_profile!(person_profile.id)
    end

    test "delete_person_profile/1 deletes the person_profile" do
      person_profile = person_profile_fixture()
      assert {:ok, %PersonProfile{}} = Profiles.delete_person_profile(person_profile)
      assert_raise Ecto.NoResultsError, fn -> Profiles.get_person_profile!(person_profile.id) end
    end

    test "change_person_profile/1 returns a person_profile changeset" do
      person_profile = person_profile_fixture()
      assert %Ecto.Changeset{} = Profiles.change_person_profile(person_profile)
    end
  end
end
