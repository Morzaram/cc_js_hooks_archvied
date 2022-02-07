defmodule ClimateCoolers.InvitesTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Invites

  describe "invitations" do
    alias ClimateCoolers.Invites.Inivitation

    import ClimateCoolers.InvitesFixtures

    @invalid_attrs %{}

    test "list_invitations/0 returns all invitations" do
      inivitation = inivitation_fixture()
      assert Invites.list_invitations() == [inivitation]
    end

    test "get_inivitation!/1 returns the inivitation with given id" do
      inivitation = inivitation_fixture()
      assert Invites.get_inivitation!(inivitation.id) == inivitation
    end

    test "create_inivitation/1 with valid data creates a inivitation" do
      valid_attrs = %{}

      assert {:ok, %Inivitation{} = inivitation} = Invites.create_inivitation(valid_attrs)
    end

    test "create_inivitation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invites.create_inivitation(@invalid_attrs)
    end

    test "update_inivitation/2 with valid data updates the inivitation" do
      inivitation = inivitation_fixture()
      update_attrs = %{}

      assert {:ok, %Inivitation{} = inivitation} = Invites.update_inivitation(inivitation, update_attrs)
    end

    test "update_inivitation/2 with invalid data returns error changeset" do
      inivitation = inivitation_fixture()
      assert {:error, %Ecto.Changeset{}} = Invites.update_inivitation(inivitation, @invalid_attrs)
      assert inivitation == Invites.get_inivitation!(inivitation.id)
    end

    test "delete_inivitation/1 deletes the inivitation" do
      inivitation = inivitation_fixture()
      assert {:ok, %Inivitation{}} = Invites.delete_inivitation(inivitation)
      assert_raise Ecto.NoResultsError, fn -> Invites.get_inivitation!(inivitation.id) end
    end

    test "change_inivitation/1 returns a inivitation changeset" do
      inivitation = inivitation_fixture()
      assert %Ecto.Changeset{} = Invites.change_inivitation(inivitation)
    end
  end

  describe "invitations" do
    alias ClimateCoolers.Invites.Inivitation

    import ClimateCoolers.InvitesFixtures

    @invalid_attrs %{invite_token: nil}

    test "list_invitations/0 returns all invitations" do
      inivitation = inivitation_fixture()
      assert Invites.list_invitations() == [inivitation]
    end

    test "get_inivitation!/1 returns the inivitation with given id" do
      inivitation = inivitation_fixture()
      assert Invites.get_inivitation!(inivitation.id) == inivitation
    end

    test "create_inivitation/1 with valid data creates a inivitation" do
      valid_attrs = %{invite_token: "some invite_token"}

      assert {:ok, %Inivitation{} = inivitation} = Invites.create_inivitation(valid_attrs)
      assert inivitation.invite_token == "some invite_token"
    end

    test "create_inivitation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Invites.create_inivitation(@invalid_attrs)
    end

    test "update_inivitation/2 with valid data updates the inivitation" do
      inivitation = inivitation_fixture()
      update_attrs = %{invite_token: "some updated invite_token"}

      assert {:ok, %Inivitation{} = inivitation} = Invites.update_inivitation(inivitation, update_attrs)
      assert inivitation.invite_token == "some updated invite_token"
    end

    test "update_inivitation/2 with invalid data returns error changeset" do
      inivitation = inivitation_fixture()
      assert {:error, %Ecto.Changeset{}} = Invites.update_inivitation(inivitation, @invalid_attrs)
      assert inivitation == Invites.get_inivitation!(inivitation.id)
    end

    test "delete_inivitation/1 deletes the inivitation" do
      inivitation = inivitation_fixture()
      assert {:ok, %Inivitation{}} = Invites.delete_inivitation(inivitation)
      assert_raise Ecto.NoResultsError, fn -> Invites.get_inivitation!(inivitation.id) end
    end

    test "change_inivitation/1 returns a inivitation changeset" do
      inivitation = inivitation_fixture()
      assert %Ecto.Changeset{} = Invites.change_inivitation(inivitation)
    end
  end
end
