defmodule ClimateCoolersWeb.IndividualControllerTest do
  use ClimateCoolersWeb.ConnCase

  import ClimateCoolers.IndividualsFixtures

  @create_attrs %{description: "some description", first_name: "some first_name", last_name: "some last_name", pro_climate: true}
  @update_attrs %{description: "some updated description", first_name: "some updated first_name", last_name: "some updated last_name", pro_climate: false}
  @invalid_attrs %{description: nil, first_name: nil, last_name: nil, pro_climate: nil}

  describe "index" do
    test "lists all individuals", %{conn: conn} do
      conn = get(conn, Routes.individual_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Individuals"
    end
  end

  describe "new individual" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.individual_path(conn, :new))
      assert html_response(conn, 200) =~ "New Individual"
    end
  end

  describe "create individual" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.individual_path(conn, :create), individual: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.individual_path(conn, :show, id)

      conn = get(conn, Routes.individual_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Individual"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.individual_path(conn, :create), individual: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Individual"
    end
  end

  describe "edit individual" do
    setup [:create_individual]

    test "renders form for editing chosen individual", %{conn: conn, individual: individual} do
      conn = get(conn, Routes.individual_path(conn, :edit, individual))
      assert html_response(conn, 200) =~ "Edit Individual"
    end
  end

  describe "update individual" do
    setup [:create_individual]

    test "redirects when data is valid", %{conn: conn, individual: individual} do
      conn = put(conn, Routes.individual_path(conn, :update, individual), individual: @update_attrs)
      assert redirected_to(conn) == Routes.individual_path(conn, :show, individual)

      conn = get(conn, Routes.individual_path(conn, :show, individual))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, individual: individual} do
      conn = put(conn, Routes.individual_path(conn, :update, individual), individual: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Individual"
    end
  end

  describe "delete individual" do
    setup [:create_individual]

    test "deletes chosen individual", %{conn: conn, individual: individual} do
      conn = delete(conn, Routes.individual_path(conn, :delete, individual))
      assert redirected_to(conn) == Routes.individual_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.individual_path(conn, :show, individual))
      end
    end
  end

  defp create_individual(_) do
    individual = individual_fixture()
    %{individual: individual}
  end
end
