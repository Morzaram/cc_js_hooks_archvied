defmodule ClimateCoolersWeb.ChannelsController do
  use ClimateCoolersWeb, :controller

  alias ClimateCoolers.Attributes
  alias ClimateCoolers.Attributes.Channels

  def index(conn, _params) do
    channel = Attributes.list_channel()
    render(conn, "index.html", channel: channel)
  end

  def new(conn, _params) do
    changeset = Attributes.change_channels(%Channels{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"channels" => channels_params}) do
    case Attributes.create_channels(channels_params) do
      {:ok, channels} ->
        conn
        |> put_flash(:info, "Channels created successfully.")
        |> redirect(to: Routes.channels_path(conn, :show, channels))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    channels = Attributes.get_channels!(id)
    render(conn, "show.html", channels: channels)
  end

  def edit(conn, %{"id" => id}) do
    channels = Attributes.get_channels!(id)
    changeset = Attributes.change_channels(channels)
    render(conn, "edit.html", channels: channels, changeset: changeset)
  end

  def update(conn, %{"id" => id, "channels" => channels_params}) do
    channels = Attributes.get_channels!(id)

    case Attributes.update_channels(channels, channels_params) do
      {:ok, channels} ->
        conn
        |> put_flash(:info, "Channels updated successfully.")
        |> redirect(to: Routes.channels_path(conn, :show, channels))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", channels: channels, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    channels = Attributes.get_channels!(id)
    {:ok, _channels} = Attributes.delete_channels(channels)

    conn
    |> put_flash(:info, "Channels deleted successfully.")
    |> redirect(to: Routes.channels_path(conn, :index))
  end
end
