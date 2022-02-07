defmodule ClimateCoolersWeb.InivitationController do
  use ClimateCoolersWeb, :controller

  alias ClimateCoolers.Invites
  alias ClimateCoolers.Invites.Inivitation

  def index(conn, _params) do
    invitations = Invites.list_invitations()
    render(conn, "index.html", invitations: invitations)
  end

  def new(conn, _params) do
    changeset = Invites.change_inivitation(%Inivitation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"inivitation" => inivitation_params}) do
    case Invites.create_inivitation(inivitation_params) do
      {:ok, inivitation} ->
        conn
        |> put_flash(:info, "Inivitation created successfully.")
        |> redirect(to: Routes.inivitation_path(conn, :show, inivitation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    inivitation = Invites.get_inivitation!(id)
    render(conn, "show.html", inivitation: inivitation)
  end

  def edit(conn, %{"id" => id}) do
    inivitation = Invites.get_inivitation!(id)
    changeset = Invites.change_inivitation(inivitation)
    render(conn, "edit.html", inivitation: inivitation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "inivitation" => inivitation_params}) do
    inivitation = Invites.get_inivitation!(id)

    case Invites.update_inivitation(inivitation, inivitation_params) do
      {:ok, inivitation} ->
        conn
        |> put_flash(:info, "Inivitation updated successfully.")
        |> redirect(to: Routes.inivitation_path(conn, :show, inivitation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", inivitation: inivitation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    inivitation = Invites.get_inivitation!(id)
    {:ok, _inivitation} = Invites.delete_inivitation(inivitation)

    conn
    |> put_flash(:info, "Inivitation deleted successfully.")
    |> redirect(to: Routes.inivitation_path(conn, :index))
  end
end
