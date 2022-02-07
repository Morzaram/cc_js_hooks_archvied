defmodule ClimateCoolersWeb.ProfileLiveTest do
  use ClimateCoolersWeb.ConnCase

  import Phoenix.LiveViewTest
  import ClimateCoolers.CompanyProfilesFixtures

  @create_attrs %{description: "some description", established: %{day: 6, month: 2, year: 2022}, name: "some name", url: "some url"}
  @update_attrs %{description: "some updated description", established: %{day: 7, month: 2, year: 2022}, name: "some updated name", url: "some updated url"}
  @invalid_attrs %{description: nil, established: %{day: 30, month: 2, year: 2022}, name: nil, url: nil}

  defp create_profile(_) do
    profile = profile_fixture()
    %{profile: profile}
  end

  describe "Index" do
    setup [:create_profile]

    test "lists all company_profiles", %{conn: conn, profile: profile} do
      {:ok, _index_live, html} = live(conn, Routes.profile_index_path(conn, :index))

      assert html =~ "Listing Company profiles"
      assert html =~ profile.description
    end

    test "saves new profile", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.profile_index_path(conn, :index))

      assert index_live |> element("a", "New Profile") |> render_click() =~
               "New Profile"

      assert_patch(index_live, Routes.profile_index_path(conn, :new))

      assert index_live
             |> form("#profile-form", profile: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#profile-form", profile: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.profile_index_path(conn, :index))

      assert html =~ "Profile created successfully"
      assert html =~ "some description"
    end

    test "updates profile in listing", %{conn: conn, profile: profile} do
      {:ok, index_live, _html} = live(conn, Routes.profile_index_path(conn, :index))

      assert index_live |> element("#profile-#{profile.id} a", "Edit") |> render_click() =~
               "Edit Profile"

      assert_patch(index_live, Routes.profile_index_path(conn, :edit, profile))

      assert index_live
             |> form("#profile-form", profile: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#profile-form", profile: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.profile_index_path(conn, :index))

      assert html =~ "Profile updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes profile in listing", %{conn: conn, profile: profile} do
      {:ok, index_live, _html} = live(conn, Routes.profile_index_path(conn, :index))

      assert index_live |> element("#profile-#{profile.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#profile-#{profile.id}")
    end
  end

  describe "Show" do
    setup [:create_profile]

    test "displays profile", %{conn: conn, profile: profile} do
      {:ok, _show_live, html} = live(conn, Routes.profile_show_path(conn, :show, profile))

      assert html =~ "Show Profile"
      assert html =~ profile.description
    end

    test "updates profile within modal", %{conn: conn, profile: profile} do
      {:ok, show_live, _html} = live(conn, Routes.profile_show_path(conn, :show, profile))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Profile"

      assert_patch(show_live, Routes.profile_show_path(conn, :edit, profile))

      assert show_live
             |> form("#profile-form", profile: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#profile-form", profile: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.profile_show_path(conn, :show, profile))

      assert html =~ "Profile updated successfully"
      assert html =~ "some updated description"
    end
  end
end
