defmodule ClimateCoolersWeb.PersonProfileControllerTest do
  use ClimateCoolersWeb.ConnCase

  import ClimateCoolers.Profiles.PersonFixtures

  @create_attrs %{birthdate: ~D[2022-02-06], description: "some description", name: "some name"}
  @update_attrs %{birthdate: ~D[2022-02-07], description: "some updated description", name: "some updated name"}
  @invalid_attrs %{birthdate: nil, description: nil, name: nil}

  describe "index" do
    test "lists all person_profiles", %{conn: conn} do
      conn = get(conn, Routes.person_profile_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Person profiles"
    end
  end

  describe "new person_profile" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.person_profile_path(conn, :new))
      assert html_response(conn, 200) =~ "New Person profile"
    end
  end

  describe "create person_profile" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.person_profile_path(conn, :create), person_profile: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.person_profile_path(conn, :show, id)

      conn = get(conn, Routes.person_profile_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Person profile"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.person_profile_path(conn, :create), person_profile: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Person profile"
    end
  end

  describe "edit person_profile" do
    setup [:create_person_profile]

    test "renders form for editing chosen person_profile", %{conn: conn, person_profile: person_profile} do
      conn = get(conn, Routes.person_profile_path(conn, :edit, person_profile))
      assert html_response(conn, 200) =~ "Edit Person profile"
    end
  end

  describe "update person_profile" do
    setup [:create_person_profile]

    test "redirects when data is valid", %{conn: conn, person_profile: person_profile} do
      conn = put(conn, Routes.person_profile_path(conn, :update, person_profile), person_profile: @update_attrs)
      assert redirected_to(conn) == Routes.person_profile_path(conn, :show, person_profile)

      conn = get(conn, Routes.person_profile_path(conn, :show, person_profile))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, person_profile: person_profile} do
      conn = put(conn, Routes.person_profile_path(conn, :update, person_profile), person_profile: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Person profile"
    end
  end

  describe "delete person_profile" do
    setup [:create_person_profile]

    test "deletes chosen person_profile", %{conn: conn, person_profile: person_profile} do
      conn = delete(conn, Routes.person_profile_path(conn, :delete, person_profile))
      assert redirected_to(conn) == Routes.person_profile_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.person_profile_path(conn, :show, person_profile))
      end
    end
  end

  defp create_person_profile(_) do
    person_profile = person_profile_fixture()
    %{person_profile: person_profile}
  end
end
