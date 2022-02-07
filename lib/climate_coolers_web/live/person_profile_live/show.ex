defmodule ClimateCoolersWeb.ProfileLive.Show do
  use ClimateCoolersWeb, :live_view

  alias ClimateCoolers.PersonProfiles

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:profile, PersonProfiles.get_profile!(id))}
  end

  defp page_title(:show), do: "Show Profile"
  defp page_title(:edit), do: "Edit Profile"
end
