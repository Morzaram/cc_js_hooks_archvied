defmodule ClimateCoolersWeb.PersonProfileController do
  use ClimateCoolersWeb, :controller
  import IEx
  alias ClimateCoolers.Profiles.Person
  alias ClimateCoolers.Profiles.Person.PersonProfile

  def index(conn, _params) do
    person_profiles = Person.list_person_profiles()
    render(conn, "index.html", person_profiles: person_profiles)
  end

  def new(conn, _params) do
    changeset = Person.change_person_profile(%PersonProfile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"person_profile" => person_profile_params}) do
    case Person.create_person_profile(person_profile_params) do
      {:ok, person_profile} ->
        conn
        |> put_flash(:info, "Person profile created successfully.")
        |> redirect(to: Routes.person_profile_path(conn, :show, person_profile))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person_profile = Person.get_person_profile!(id)
    render(conn, "show.html", person_profile: person_profile)
  end

  def edit(conn, %{"id" => id}) do
    person_profile = Person.get_person_profile!(id)
    changeset = Person.change_person_profile(person_profile)
    render(conn, "edit.html", person_profile: person_profile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "person_profile" => person_profile_params}) do
    person_profile = Person.get_person_profile!(id)

    case Person.update_person_profile(person_profile, person_profile_params) do
      {:ok, person_profile} ->
        conn
        |> put_flash(:info, "Person profile updated successfully.")
        |> redirect(to: Routes.person_profile_path(conn, :show, person_profile))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", person_profile: person_profile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person_profile = Person.get_person_profile!(id)
    {:ok, _person_profile} = Person.delete_person_profile(person_profile)

    conn
    |> put_flash(:info, "Person profile deleted successfully.")
    |> redirect(to: Routes.person_profile_path(conn, :index))
  end
end
