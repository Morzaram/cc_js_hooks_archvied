defmodule ClimateCoolersWeb.ChannelsControllerTest do
  use ClimateCoolersWeb.ConnCase

  import ClimateCoolers.AttributesFixtures

  @create_attrs %{name: "some name", url: "some url"}
  @update_attrs %{name: "some updated name", url: "some updated url"}
  @invalid_attrs %{name: nil, url: nil}

  describe "index" do
    test "lists all channel", %{conn: conn} do
      conn = get(conn, Routes.channels_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Channel"
    end
  end

  describe "new channels" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.channels_path(conn, :new))
      assert html_response(conn, 200) =~ "New Channels"
    end
  end

  describe "create channels" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.channels_path(conn, :create), channels: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.channels_path(conn, :show, id)

      conn = get(conn, Routes.channels_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Channels"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.channels_path(conn, :create), channels: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Channels"
    end
  end

  describe "edit channels" do
    setup [:create_channels]

    test "renders form for editing chosen channels", %{conn: conn, channels: channels} do
      conn = get(conn, Routes.channels_path(conn, :edit, channels))
      assert html_response(conn, 200) =~ "Edit Channels"
    end
  end

  describe "update channels" do
    setup [:create_channels]

    test "redirects when data is valid", %{conn: conn, channels: channels} do
      conn = put(conn, Routes.channels_path(conn, :update, channels), channels: @update_attrs)
      assert redirected_to(conn) == Routes.channels_path(conn, :show, channels)

      conn = get(conn, Routes.channels_path(conn, :show, channels))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, channels: channels} do
      conn = put(conn, Routes.channels_path(conn, :update, channels), channels: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Channels"
    end
  end

  describe "delete channels" do
    setup [:create_channels]

    test "deletes chosen channels", %{conn: conn, channels: channels} do
      conn = delete(conn, Routes.channels_path(conn, :delete, channels))
      assert redirected_to(conn) == Routes.channels_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.channels_path(conn, :show, channels))
      end
    end
  end

  defp create_channels(_) do
    channels = channels_fixture()
    %{channels: channels}
  end
end
