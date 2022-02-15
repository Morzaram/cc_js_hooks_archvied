defmodule ClimateCoolersWeb.PersonProfileLive.FormComponent do
  require IEx
  use ClimateCoolersWeb, :live_component

  import Ecto.Changeset
  alias ClimateCoolers.PersonProfiles
  alias ClimateCoolers.Profiles.ProfileAttributes.{Link, Image}

  @impl true
  def update(%{profile: profile} = assigns, socket) do
    IO.inspect(assigns)
    changeset = PersonProfiles.change_profile(profile)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"person_profile" => profile_params}, socket) do
    IO.inspect(socket)

    changeset =
      socket.assigns.profile
      |> PersonProfiles.change_profile(profile_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("validate", props, socket) do
    IO.inspect(props)

    changeset =
      socket.assigns.profile
      |> PersonProfiles.change_profile(props)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("add-link", _, socket) do
    cs = socket.assigns.changeset
    changeset = put_assoc(cs, :links, fetch_field!(cs, :links) ++ [%Link{}])

    {:noreply, socket |> assign(:changeset, changeset)}
  end

  def handle_event("add-pic", _, socket) do
    cs = socket.assigns.changeset
    changeset = put_assoc(cs, :pics, fetch_field!(cs, :pics) ++ [%Image{}])

    {:noreply, socket |> assign(:changeset, changeset)}
  end

  def handle_event("save", %{"person_profile" => profile_params} = props, socket) do
    IO.inspect(socket)

    save_profile(socket, socket.assigns.action, profile_params)
  end

  defp save_profile(socket, :edit, profile_params) do
    case PersonProfiles.update_profile(socket.assigns.profile, profile_params) do
      {:ok, _profile} ->
        {:noreply,
         socket
         |> put_flash(:info, "Profile updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_profile(socket, :new, profile_params) do
    case PersonProfiles.create_profile(profile_params) do
      {:ok, _profile} ->
        {:noreply,
         socket
         |> put_flash(:info, "Profile created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
