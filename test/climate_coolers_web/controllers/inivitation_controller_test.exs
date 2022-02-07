defmodule ClimateCoolersWeb.InivitationControllerTest do
  use ClimateCoolersWeb.ConnCase

  import ClimateCoolers.InvitesFixtures

  @create_attrs %{invite_token: "some invite_token"}
  @update_attrs %{invite_token: "some updated invite_token"}
  @invalid_attrs %{invite_token: nil}

  describe "index" do
    test "lists all invitations", %{conn: conn} do
      conn = get(conn, Routes.inivitation_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Invitations"
    end
  end

  describe "new inivitation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.inivitation_path(conn, :new))
      assert html_response(conn, 200) =~ "New Inivitation"
    end
  end

  describe "create inivitation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.inivitation_path(conn, :create), inivitation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.inivitation_path(conn, :show, id)

      conn = get(conn, Routes.inivitation_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Inivitation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.inivitation_path(conn, :create), inivitation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Inivitation"
    end
  end

  describe "edit inivitation" do
    setup [:create_inivitation]

    test "renders form for editing chosen inivitation", %{conn: conn, inivitation: inivitation} do
      conn = get(conn, Routes.inivitation_path(conn, :edit, inivitation))
      assert html_response(conn, 200) =~ "Edit Inivitation"
    end
  end

  describe "update inivitation" do
    setup [:create_inivitation]

    test "redirects when data is valid", %{conn: conn, inivitation: inivitation} do
      conn = put(conn, Routes.inivitation_path(conn, :update, inivitation), inivitation: @update_attrs)
      assert redirected_to(conn) == Routes.inivitation_path(conn, :show, inivitation)

      conn = get(conn, Routes.inivitation_path(conn, :show, inivitation))
      assert html_response(conn, 200) =~ "some updated invite_token"
    end

    test "renders errors when data is invalid", %{conn: conn, inivitation: inivitation} do
      conn = put(conn, Routes.inivitation_path(conn, :update, inivitation), inivitation: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Inivitation"
    end
  end

  describe "delete inivitation" do
    setup [:create_inivitation]

    test "deletes chosen inivitation", %{conn: conn, inivitation: inivitation} do
      conn = delete(conn, Routes.inivitation_path(conn, :delete, inivitation))
      assert redirected_to(conn) == Routes.inivitation_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.inivitation_path(conn, :show, inivitation))
      end
    end
  end

  defp create_inivitation(_) do
    inivitation = inivitation_fixture()
    %{inivitation: inivitation}
  end
end
