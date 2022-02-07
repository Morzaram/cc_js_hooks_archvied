defmodule ClimateCoolersWeb.PersonProfileLive.Index do
  use ClimateCoolersWeb, :live_view

  alias ClimateCoolers.PersonProfiles
  alias ClimateCoolers.PersonProfiles.Profile

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :person_profiles, list_person_profiles())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Profile")
    |> assign(:profile, PersonProfiles.get_profile!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Profile")
    |> assign(:profile, %Profile{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Person profiles")
    |> assign(:profile, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    profile = PersonProfiles.get_profile!(id)
    {:ok, _} = PersonProfiles.delete_profile(profile)

    {:noreply, assign(socket, :person_profiles, list_person_profiles())}
  end

  defp list_person_profiles do
    PersonProfiles.list_person_profiles()
  end
end
