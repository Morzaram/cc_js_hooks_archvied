defmodule ClimateCoolersWeb.CompanyProfileLiveTest do
  use ClimateCoolersWeb.ConnCase

  import Phoenix.LiveViewTest
  import ClimateCoolers.CompanyProfilesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_company_profile(_) do
    company_profile = company_profile_fixture()
    %{company_profile: company_profile}
  end

  describe "Index" do
    setup [:create_company_profile]

    test "lists all company_profiles", %{conn: conn, company_profile: company_profile} do
      {:ok, _index_live, html} = live(conn, Routes.company_profile_index_path(conn, :index))

      assert html =~ "Listing Company profiles"
      assert html =~ company_profile.name
    end

    test "saves new company_profile", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.company_profile_index_path(conn, :index))

      assert index_live |> element("a", "New Company profile") |> render_click() =~
               "New Company profile"

      assert_patch(index_live, Routes.company_profile_index_path(conn, :new))

      assert index_live
             |> form("#company_profile-form", company_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#company_profile-form", company_profile: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.company_profile_index_path(conn, :index))

      assert html =~ "Company profile created successfully"
      assert html =~ "some name"
    end

    test "updates company_profile in listing", %{conn: conn, company_profile: company_profile} do
      {:ok, index_live, _html} = live(conn, Routes.company_profile_index_path(conn, :index))

      assert index_live |> element("#company_profile-#{company_profile.id} a", "Edit") |> render_click() =~
               "Edit Company profile"

      assert_patch(index_live, Routes.company_profile_index_path(conn, :edit, company_profile))

      assert index_live
             |> form("#company_profile-form", company_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#company_profile-form", company_profile: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.company_profile_index_path(conn, :index))

      assert html =~ "Company profile updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes company_profile in listing", %{conn: conn, company_profile: company_profile} do
      {:ok, index_live, _html} = live(conn, Routes.company_profile_index_path(conn, :index))

      assert index_live |> element("#company_profile-#{company_profile.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#company_profile-#{company_profile.id}")
    end
  end

  describe "Show" do
    setup [:create_company_profile]

    test "displays company_profile", %{conn: conn, company_profile: company_profile} do
      {:ok, _show_live, html} = live(conn, Routes.company_profile_show_path(conn, :show, company_profile))

      assert html =~ "Show Company profile"
      assert html =~ company_profile.name
    end

    test "updates company_profile within modal", %{conn: conn, company_profile: company_profile} do
      {:ok, show_live, _html} = live(conn, Routes.company_profile_show_path(conn, :show, company_profile))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Company profile"

      assert_patch(show_live, Routes.company_profile_show_path(conn, :edit, company_profile))

      assert show_live
             |> form("#company_profile-form", company_profile: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#company_profile-form", company_profile: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.company_profile_show_path(conn, :show, company_profile))

      assert html =~ "Company profile updated successfully"
      assert html =~ "some updated name"
    end
  end
end
