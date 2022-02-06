defmodule ClimateCoolers.AttributesTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Attributes

  describe "channel" do
    alias ClimateCoolers.Attributes.Channels

    import ClimateCoolers.AttributesFixtures

    @invalid_attrs %{name: nil, url: nil}

    test "list_channel/0 returns all channel" do
      channels = channels_fixture()
      assert Attributes.list_channel() == [channels]
    end

    test "get_channels!/1 returns the channels with given id" do
      channels = channels_fixture()
      assert Attributes.get_channels!(channels.id) == channels
    end

    test "create_channels/1 with valid data creates a channels" do
      valid_attrs = %{name: "some name", url: "some url"}

      assert {:ok, %Channels{} = channels} = Attributes.create_channels(valid_attrs)
      assert channels.name == "some name"
      assert channels.url == "some url"
    end

    test "create_channels/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attributes.create_channels(@invalid_attrs)
    end

    test "update_channels/2 with valid data updates the channels" do
      channels = channels_fixture()
      update_attrs = %{name: "some updated name", url: "some updated url"}

      assert {:ok, %Channels{} = channels} = Attributes.update_channels(channels, update_attrs)
      assert channels.name == "some updated name"
      assert channels.url == "some updated url"
    end

    test "update_channels/2 with invalid data returns error changeset" do
      channels = channels_fixture()
      assert {:error, %Ecto.Changeset{}} = Attributes.update_channels(channels, @invalid_attrs)
      assert channels == Attributes.get_channels!(channels.id)
    end

    test "delete_channels/1 deletes the channels" do
      channels = channels_fixture()
      assert {:ok, %Channels{}} = Attributes.delete_channels(channels)
      assert_raise Ecto.NoResultsError, fn -> Attributes.get_channels!(channels.id) end
    end

    test "change_channels/1 returns a channels changeset" do
      channels = channels_fixture()
      assert %Ecto.Changeset{} = Attributes.change_channels(channels)
    end
  end
end
