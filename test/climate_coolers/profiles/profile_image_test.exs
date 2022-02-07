defmodule ClimateCoolers.Profiles.ProfileImageTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Profiles.ProfileImage

  describe "company_profile_images" do
    alias ClimateCoolers.Profiles.ProfileImage.ProfileImage

    import ClimateCoolers.Profiles.ProfileImageFixtures

    @invalid_attrs %{link_name: nil, url: nil}

    test "list_company_profile_images/0 returns all company_profile_images" do
      company_profile_image = company_profile_image_fixture()
      assert ProfileImage.list_company_profile_images() == [company_profile_image]
    end

    test "get_company_profile_image!/1 returns the company_profile_image with given id" do
      company_profile_image = company_profile_image_fixture()

      assert ProfileImage.get_company_profile_image!(company_profile_image.id) ==
               company_profile_image
    end

    test "create_company_profile_image/1 with valid data creates a company_profile_image" do
      valid_attrs = %{link_name: "some link_name", url: "some url"}

      assert {:ok, %ProfileImage{} = company_profile_image} =
               ProfileImage.create_company_profile_image(valid_attrs)

      assert company_profile_image.link_name == "some link_name"
      assert company_profile_image.url == "some url"
    end

    test "create_company_profile_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               ProfileImage.create_company_profile_image(@invalid_attrs)
    end

    test "update_company_profile_image/2 with valid data updates the company_profile_image" do
      company_profile_image = company_profile_image_fixture()
      update_attrs = %{link_name: "some updated link_name", url: "some updated url"}

      assert {:ok, %ProfileImage{} = company_profile_image} =
               ProfileImage.update_company_profile_image(company_profile_image, update_attrs)

      assert company_profile_image.link_name == "some updated link_name"
      assert company_profile_image.url == "some updated url"
    end

    test "update_company_profile_image/2 with invalid data returns error changeset" do
      company_profile_image = company_profile_image_fixture()

      assert {:error, %Ecto.Changeset{}} =
               ProfileImage.update_company_profile_image(company_profile_image, @invalid_attrs)

      assert company_profile_image ==
               ProfileImage.get_company_profile_image!(company_profile_image.id)
    end

    test "delete_company_profile_image/1 deletes the company_profile_image" do
      company_profile_image = company_profile_image_fixture()

      assert {:ok, %ProfileImage{}} =
               ProfileImage.delete_company_profile_image(company_profile_image)

      assert_raise Ecto.NoResultsError, fn ->
        ProfileImage.get_company_profile_image!(company_profile_image.id)
      end
    end

    test "change_company_profile_image/1 returns a company_profile_image changeset" do
      company_profile_image = company_profile_image_fixture()
      assert %Ecto.Changeset{} = ProfileImage.change_company_profile_image(company_profile_image)
    end
  end

  describe "person_profile_images" do
    alias ClimateCoolers.Profiles.ProfileImage.PersonProfileImage

    import ClimateCoolers.Profiles.ProfileImageFixtures

    @invalid_attrs %{link_name: nil, url: nil}

    test "list_person_profile_images/0 returns all person_profile_images" do
      person_profile_image = person_profile_image_fixture()
      assert ProfileImage.list_person_profile_images() == [person_profile_image]
    end

    test "get_person_profile_image!/1 returns the person_profile_image with given id" do
      person_profile_image = person_profile_image_fixture()

      assert ProfileImage.get_person_profile_image!(person_profile_image.id) ==
               person_profile_image
    end

    test "create_person_profile_image/1 with valid data creates a person_profile_image" do
      valid_attrs = %{link_name: "some link_name", url: "some url"}

      assert {:ok, %PersonProfileImage{} = person_profile_image} =
               ProfileImage.create_person_profile_image(valid_attrs)

      assert person_profile_image.link_name == "some link_name"
      assert person_profile_image.url == "some url"
    end

    test "create_person_profile_image/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               ProfileImage.create_person_profile_image(@invalid_attrs)
    end

    test "update_person_profile_image/2 with valid data updates the person_profile_image" do
      person_profile_image = person_profile_image_fixture()
      update_attrs = %{link_name: "some updated link_name", url: "some updated url"}

      assert {:ok, %PersonProfileImage{} = person_profile_image} =
               ProfileImage.update_person_profile_image(person_profile_image, update_attrs)

      assert person_profile_image.link_name == "some updated link_name"
      assert person_profile_image.url == "some updated url"
    end

    test "update_person_profile_image/2 with invalid data returns error changeset" do
      person_profile_image = person_profile_image_fixture()

      assert {:error, %Ecto.Changeset{}} =
               ProfileImage.update_person_profile_image(person_profile_image, @invalid_attrs)

      assert person_profile_image ==
               ProfileImage.get_person_profile_image!(person_profile_image.id)
    end

    test "delete_person_profile_image/1 deletes the person_profile_image" do
      person_profile_image = person_profile_image_fixture()

      assert {:ok, %PersonProfileImage{}} =
               ProfileImage.delete_person_profile_image(person_profile_image)

      assert_raise Ecto.NoResultsError, fn ->
        ProfileImage.get_person_profile_image!(person_profile_image.id)
      end
    end

    test "change_person_profile_image/1 returns a person_profile_image changeset" do
      person_profile_image = person_profile_image_fixture()
      assert %Ecto.Changeset{} = ProfileImage.change_person_profile_image(person_profile_image)
    end
  end
end
