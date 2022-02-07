defmodule ClimateCoolersWeb.ProfileImageLive.Index do
  use ClimateCoolersWeb, :live_view

  alias ClimateCoolers.ProfileImages
  alias ClimateCoolers.ProfileImages.Image

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :profile_images, list_profile_images())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Image")
    |> assign(:image, ProfileImages.get_image!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Image")
    |> assign(:image, %Image{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Profile images")
    |> assign(:image, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    image = ProfileImages.get_image!(id)
    {:ok, _} = ProfileImages.delete_image(image)

    {:noreply, assign(socket, :profile_images, list_profile_images())}
  end

  defp list_profile_images do
    ProfileImages.list_profile_images()
  end
end
