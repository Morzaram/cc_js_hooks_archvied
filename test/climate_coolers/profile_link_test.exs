defmodule ClimateCoolers.ProfileLinkTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.ProfileLink

  describe "profile_link" do
    alias ClimateCoolers.ProfileLink.Link

    import ClimateCoolers.ProfileLinkFixtures

    @invalid_attrs %{title: nil, url: nil}

    test "list_profile_link/0 returns all profile_link" do
      link = link_fixture()
      assert ProfileLink.list_profile_link() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert ProfileLink.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      valid_attrs = %{title: "some title", url: "some url"}

      assert {:ok, %Link{} = link} = ProfileLink.create_link(valid_attrs)
      assert link.title == "some title"
      assert link.url == "some url"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProfileLink.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = %{title: "some updated title", url: "some updated url"}

      assert {:ok, %Link{} = link} = ProfileLink.update_link(link, update_attrs)
      assert link.title == "some updated title"
      assert link.url == "some updated url"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = ProfileLink.update_link(link, @invalid_attrs)
      assert link == ProfileLink.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = ProfileLink.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> ProfileLink.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = ProfileLink.change_link(link)
    end
  end
end
