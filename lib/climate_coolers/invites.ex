defmodule ClimateCoolers.Invites do
  @moduledoc """
  The Invites context.
  """

  import Ecto.Query, warn: false
  alias ClimateCoolers.Repo

  alias ClimateCoolers.Invites.Inivitation

  @doc """
  Returns the list of invitations.

  ## Examples

      iex> list_invitations()
      [%Inivitation{}, ...]

  """
  def list_invitations do
    Repo.all(Inivitation)
  end

  @doc """
  Gets a single inivitation.

  Raises `Ecto.NoResultsError` if the Inivitation does not exist.

  ## Examples

      iex> get_inivitation!(123)
      %Inivitation{}

      iex> get_inivitation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inivitation!(id), do: Repo.get!(Inivitation, id)

  @doc """
  Creates a inivitation.

  ## Examples

      iex> create_inivitation(%{field: value})
      {:ok, %Inivitation{}}

      iex> create_inivitation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inivitation(attrs \\ %{}) do
    %Inivitation{}
    |> Inivitation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a inivitation.

  ## Examples

      iex> update_inivitation(inivitation, %{field: new_value})
      {:ok, %Inivitation{}}

      iex> update_inivitation(inivitation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inivitation(%Inivitation{} = inivitation, attrs) do
    inivitation
    |> Inivitation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a inivitation.

  ## Examples

      iex> delete_inivitation(inivitation)
      {:ok, %Inivitation{}}

      iex> delete_inivitation(inivitation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inivitation(%Inivitation{} = inivitation) do
    Repo.delete(inivitation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inivitation changes.

  ## Examples

      iex> change_inivitation(inivitation)
      %Ecto.Changeset{data: %Inivitation{}}

  """
  def change_inivitation(%Inivitation{} = inivitation, attrs \\ %{}) do
    Inivitation.changeset(inivitation, attrs)
  end
end
