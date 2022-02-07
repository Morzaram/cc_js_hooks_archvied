defmodule ClimateCoolers.ProfileTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Profile

  describe "profile_images" do
    alias ClimateCoolers.Profile.Images

    import ClimateCoolers.ProfileFixtures

    @invalid_attrs %{alt: nil, url: nil}

    test "list_profile_images/0 returns all profile_images" do
      images = images_fixture()
      assert Profile.list_profile_images() == [images]
    end

    test "get_images!/1 returns the images with given id" do
      images = images_fixture()
      assert Profile.get_images!(images.id) == images
    end

    test "create_images/1 with valid data creates a images" do
      valid_attrs = %{alt: "some alt", url: "some url"}

      assert {:ok, %Images{} = images} = Profile.create_images(valid_attrs)
      assert images.alt == "some alt"
      assert images.url == "some url"
    end

    test "create_images/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_images(@invalid_attrs)
    end

    test "update_images/2 with valid data updates the images" do
      images = images_fixture()
      update_attrs = %{alt: "some updated alt", url: "some updated url"}

      assert {:ok, %Images{} = images} = Profile.update_images(images, update_attrs)
      assert images.alt == "some updated alt"
      assert images.url == "some updated url"
    end

    test "update_images/2 with invalid data returns error changeset" do
      images = images_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_images(images, @invalid_attrs)
      assert images == Profile.get_images!(images.id)
    end

    test "delete_images/1 deletes the images" do
      images = images_fixture()
      assert {:ok, %Images{}} = Profile.delete_images(images)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_images!(images.id) end
    end

    test "change_images/1 returns a images changeset" do
      images = images_fixture()
      assert %Ecto.Changeset{} = Profile.change_images(images)
    end
  end
end
