defmodule ClimateCoolers.Profiles.PersonProfileImageTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Profiles.PersonProfileImage

  describe "person_profile_images" do
    alias ClimateCoolers.Profiles.Person.ProfileImages.ProfileImage

    import ClimateCoolers.Profiles.PersonProfileImageFixtures

    @invalid_attrs %{link_name: nil, url: nil}

    test "list_person_profile_images/0 returns all person_profile_images" do
      person_profile_image = person_profile_image_fixture()
      assert PersonProfileImage.list_person_profile_images() == [person_profile_image]
    end

    test "get_person_profile_image!/1 returns the person_profile_image with given id" do
      person_profile_image = person_profile_image_fixture()

      assert PersonProfileImage.get_person_profile_image!(person_profile_image.id) ==
               person_profile_image
    end

    test "create_person_profile_image/1 with valid data creates a person_profile_image" do
      valid_attrs = %{link_name: "some link_name", url: "some url"}

      assert {:ok, %PersonProfileImage{} = person_profile_image} =
               PersonProfileImage.create_person_profile_image(valid_attrs)

      assert person_profile_image.link_name == "some link_name"
      assert person_profile_image.url == "some url"
    end

    test "create_person_profile_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               PersonProfileImage.create_person_profile_image(@invalid_attrs)
    end

    test "update_person_profile_image/2 with valid data updates the person_profile_image" do
      person_profile_image = person_profile_image_fixture()
      update_attrs = %{link_name: "some updated link_name", url: "some updated url"}

      assert {:ok, %PersonProfileImage{} = person_profile_image} =
               PersonProfileImage.update_person_profile_image(person_profile_image, update_attrs)

      assert person_profile_image.link_name == "some updated link_name"
      assert person_profile_image.url == "some updated url"
    end

    test "update_person_profile_image/2 with invalid data returns error changeset" do
      person_profile_image = person_profile_image_fixture()

      assert {:error, %Ecto.Changeset{}} =
               PersonProfileImage.update_person_profile_image(
                 person_profile_image,
                 @invalid_attrs
               )

      assert person_profile_image ==
               PersonProfileImage.get_person_profile_image!(person_profile_image.id)
    end

    test "delete_person_profile_image/1 deletes the person_profile_image" do
      person_profile_image = person_profile_image_fixture()

      assert {:ok, %PersonProfileImage{}} =
               PersonProfileImage.delete_person_profile_image(person_profile_image)

      assert_raise Ecto.NoResultsError, fn ->
        PersonProfileImage.get_person_profile_image!(person_profile_image.id)
      end
    end

    test "change_person_profile_image/1 returns a person_profile_image changeset" do
      person_profile_image = person_profile_image_fixture()

      assert %Ecto.Changeset{} =
               PersonProfileImage.change_person_profile_image(person_profile_image)
    end
  end
end
