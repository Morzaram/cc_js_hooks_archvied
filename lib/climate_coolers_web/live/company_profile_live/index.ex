defmodule ClimateCoolersWeb.CompanyProfileLive.Index do
  use ClimateCoolersWeb, :live_view

  alias ClimateCoolers.CompanyProfiles
  alias ClimateCoolers.Profiles.CompanyProfile, as: Profile

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :company_profiles, list_company_profiles())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Profile")
    |> assign(:profile, CompanyProfiles.get_profile!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Profile")
    |> assign(:profile, %Profile{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Company profiles")
    |> assign(:profile, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    profile = CompanyProfiles.get_profile!(id)
    {:ok, _} = CompanyProfiles.delete_profile(profile)

    {:noreply, assign(socket, :company_profiles, list_company_profiles())}
  end

  defp list_company_profiles do
    CompanyProfiles.list_company_profiles()
  end
end
