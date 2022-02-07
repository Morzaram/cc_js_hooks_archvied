defmodule ClimateCoolersWeb.CompanyProfileControllerTest do
  use ClimateCoolersWeb.ConnCase

  import ClimateCoolers.Profiles.CompanyFixtures

  @create_attrs %{description: "some description", established_in: ~D[2022-02-06], name: "some name", url: "some url"}
  @update_attrs %{description: "some updated description", established_in: ~D[2022-02-07], name: "some updated name", url: "some updated url"}
  @invalid_attrs %{description: nil, established_in: nil, name: nil, url: nil}

  describe "index" do
    test "lists all company_profiles", %{conn: conn} do
      conn = get(conn, Routes.company_profile_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Company profiles"
    end
  end

  describe "new company_profile" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.company_profile_path(conn, :new))
      assert html_response(conn, 200) =~ "New Company profile"
    end
  end

  describe "create company_profile" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.company_profile_path(conn, :create), company_profile: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.company_profile_path(conn, :show, id)

      conn = get(conn, Routes.company_profile_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Company profile"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.company_profile_path(conn, :create), company_profile: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Company profile"
    end
  end

  describe "edit company_profile" do
    setup [:create_company_profile]

    test "renders form for editing chosen company_profile", %{conn: conn, company_profile: company_profile} do
      conn = get(conn, Routes.company_profile_path(conn, :edit, company_profile))
      assert html_response(conn, 200) =~ "Edit Company profile"
    end
  end

  describe "update company_profile" do
    setup [:create_company_profile]

    test "redirects when data is valid", %{conn: conn, company_profile: company_profile} do
      conn = put(conn, Routes.company_profile_path(conn, :update, company_profile), company_profile: @update_attrs)
      assert redirected_to(conn) == Routes.company_profile_path(conn, :show, company_profile)

      conn = get(conn, Routes.company_profile_path(conn, :show, company_profile))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, company_profile: company_profile} do
      conn = put(conn, Routes.company_profile_path(conn, :update, company_profile), company_profile: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Company profile"
    end
  end

  describe "delete company_profile" do
    setup [:create_company_profile]

    test "deletes chosen company_profile", %{conn: conn, company_profile: company_profile} do
      conn = delete(conn, Routes.company_profile_path(conn, :delete, company_profile))
      assert redirected_to(conn) == Routes.company_profile_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.company_profile_path(conn, :show, company_profile))
      end
    end
  end

  defp create_company_profile(_) do
    company_profile = company_profile_fixture()
    %{company_profile: company_profile}
  end
end
