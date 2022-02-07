defmodule ClimateCoolersWeb.PersonProfileLiveTest do
  use ClimateCoolersWeb.ConnCase

  import Phoenix.LiveViewTest
  import ClimateCoolers.ProfilesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_person_profile(_) do
    person_profile = person_profile_fixture()
    %{person_profile: person_profile}
  end

  describe "Index" do
    setup [:create_person_profile]

    test "lists all person_profiles", %{conn: conn, person_profile: person_profile} do
      {:ok, _index_live, html} = live(conn, Routes.person_profile_index_path(conn, :index))

      assert html =~ "Listing Person profiles"
      assert html =~ person_profile.name
    end

    test "saves new person_profile", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.person_profile_index_path(conn, :index))

      assert index_live |> element("a", "New Person profile") |> render_click() =~
               "New Person profile"

      assert_patch(index_live, Routes.person_profile_index_path(conn, :new))

      assert index_live
             |> form("#person_profile-form", person_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#person_profile-form", person_profile: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.person_profile_index_path(conn, :index))

      assert html =~ "Person profile created successfully"
      assert html =~ "some name"
    end

    test "updates person_profile in listing", %{conn: conn, person_profile: person_profile} do
      {:ok, index_live, _html} = live(conn, Routes.person_profile_index_path(conn, :index))

      assert index_live |> element("#person_profile-#{person_profile.id} a", "Edit") |> render_click() =~
               "Edit Person profile"

      assert_patch(index_live, Routes.person_profile_index_path(conn, :edit, person_profile))

      assert index_live
             |> form("#person_profile-form", person_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#person_profile-form", person_profile: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.person_profile_index_path(conn, :index))

      assert html =~ "Person profile updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes person_profile in listing", %{conn: conn, person_profile: person_profile} do
      {:ok, index_live, _html} = live(conn, Routes.person_profile_index_path(conn, :index))

      assert index_live |> element("#person_profile-#{person_profile.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#person_profile-#{person_profile.id}")
    end
  end

  describe "Show" do
    setup [:create_person_profile]

    test "displays person_profile", %{conn: conn, person_profile: person_profile} do
      {:ok, _show_live, html} = live(conn, Routes.person_profile_show_path(conn, :show, person_profile))

      assert html =~ "Show Person profile"
      assert html =~ person_profile.name
    end

    test "updates person_profile within modal", %{conn: conn, person_profile: person_profile} do
      {:ok, show_live, _html} = live(conn, Routes.person_profile_show_path(conn, :show, person_profile))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Person profile"

      assert_patch(show_live, Routes.person_profile_show_path(conn, :edit, person_profile))

      assert show_live
             |> form("#person_profile-form", person_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#person_profile-form", person_profile: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.person_profile_show_path(conn, :show, person_profile))

      assert html =~ "Person profile updated successfully"
      assert html =~ "some updated name"
    end
  end
end
