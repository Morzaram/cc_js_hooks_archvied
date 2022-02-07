defmodule ClimateCoolers.Profiles.ImagesTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Profiles.Images

  describe "profile_images" do
    alias ClimateCoolers.Profiles.Images.Image

    import ClimateCoolers.Profiles.ImagesFixtures

    @invalid_attrs %{alt: nil, url: nil}

    test "list_profile_images/0 returns all profile_images" do
      image = image_fixture()
      assert Images.list_profile_images() == [image]
    end

    test "get_image!/1 returns the image with given id" do
      image = image_fixture()
      assert Images.get_image!(image.id) == image
    end

    test "create_image/1 with valid data creates a image" do
      valid_attrs = %{alt: "some alt", url: "some url"}

      assert {:ok, %Image{} = image} = Images.create_image(valid_attrs)
      assert image.alt == "some alt"
      assert image.url == "some url"
    end

    test "create_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Images.create_image(@invalid_attrs)
    end

    test "update_image/2 with valid data updates the image" do
      image = image_fixture()
      update_attrs = %{alt: "some updated alt", url: "some updated url"}

      assert {:ok, %Image{} = image} = Images.update_image(image, update_attrs)
      assert image.alt == "some updated alt"
      assert image.url == "some updated url"
    end

    test "update_image/2 with invalid data returns error changeset" do
      image = image_fixture()
      assert {:error, %Ecto.Changeset{}} = Images.update_image(image, @invalid_attrs)
      assert image == Images.get_image!(image.id)
    end

    test "delete_image/1 deletes the image" do
      image = image_fixture()
      assert {:ok, %Image{}} = Images.delete_image(image)
      assert_raise Ecto.NoResultsError, fn -> Images.get_image!(image.id) end
    end

    test "change_image/1 returns a image changeset" do
      image = image_fixture()
      assert %Ecto.Changeset{} = Images.change_image(image)
    end
  end
end
