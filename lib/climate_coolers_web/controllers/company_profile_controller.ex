defmodule ClimateCoolersWeb.CompanyProfileController do
  use ClimateCoolersWeb, :controller

  alias ClimateCoolers.Profiles.Company
  alias ClimateCoolers.Profiles.Company.CompanyProfile

  def index(conn, _params) do
    company_profiles = Company.list_company_profiles()
    render(conn, "index.html", company_profiles: company_profiles)
  end

  def new(conn, _params) do
    changeset = Company.change_company_profile(%CompanyProfile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"company_profile" => company_profile_params}) do
    case Company.create_company_profile(company_profile_params) do
      {:ok, company_profile} ->
        conn
        |> put_flash(:info, "Company profile created successfully.")
        |> redirect(to: Routes.company_profile_path(conn, :show, company_profile))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    company_profile = Company.get_company_profile!(id)
    render(conn, "show.html", company_profile: company_profile)
  end

  def edit(conn, %{"id" => id}) do
    company_profile = Company.get_company_profile!(id)
    changeset = Company.change_company_profile(company_profile)
    render(conn, "edit.html", company_profile: company_profile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "company_profile" => company_profile_params}) do
    company_profile = Company.get_company_profile!(id)

    case Company.update_company_profile(company_profile, company_profile_params) do
      {:ok, company_profile} ->
        conn
        |> put_flash(:info, "Company profile updated successfully.")
        |> redirect(to: Routes.company_profile_path(conn, :show, company_profile))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", company_profile: company_profile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    company_profile = Company.get_company_profile!(id)
    {:ok, _company_profile} = Company.delete_company_profile(company_profile)

    conn
    |> put_flash(:info, "Company profile deleted successfully.")
    |> redirect(to: Routes.company_profile_path(conn, :index))
  end
end
