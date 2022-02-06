defmodule ClimateCoolersWeb.IndividualController do
  use ClimateCoolersWeb, :controller

  alias ClimateCoolers.Individuals
  alias ClimateCoolers.Individuals.Individual

  def index(conn, _params) do
    individuals = Individuals.list_individuals()
    render(conn, "index.html", individuals: individuals)
  end

  def new(conn, _params) do
    changeset = Individuals.change_individual(%Individual{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"individual" => individual_params}) do
    case Individuals.create_individual(individual_params) do
      {:ok, individual} ->
        conn
        |> put_flash(:info, "Individual created successfully.")
        |> redirect(to: Routes.individual_path(conn, :show, individual))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    individual = Individuals.get_individual!(id)
    render(conn, "show.html", individual: individual)
  end

  def edit(conn, %{"id" => id}) do
    individual = Individuals.get_individual!(id)
    changeset = Individuals.change_individual(individual)
    render(conn, "edit.html", individual: individual, changeset: changeset)
  end

  def update(conn, %{"id" => id, "individual" => individual_params}) do
    individual = Individuals.get_individual!(id)

    case Individuals.update_individual(individual, individual_params) do
      {:ok, individual} ->
        conn
        |> put_flash(:info, "Individual updated successfully.")
        |> redirect(to: Routes.individual_path(conn, :show, individual))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", individual: individual, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    individual = Individuals.get_individual!(id)
    {:ok, _individual} = Individuals.delete_individual(individual)

    conn
    |> put_flash(:info, "Individual deleted successfully.")
    |> redirect(to: Routes.individual_path(conn, :index))
  end
end
