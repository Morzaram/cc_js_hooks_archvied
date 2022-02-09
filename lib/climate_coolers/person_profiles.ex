defmodule ClimateCoolers.PersonProfiles do
  @moduledoc """
  The PersonProfiles context.
  """
  require IEx
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias ClimateCoolers.Repo

  alias ClimateCoolers.Profiles.PersonProfile, as: Profile
  alias ClimateCoolers.Profiles.ProfileAttributes.{Link, Image}

  @doc """
  Returns the list of person_profiles.

  ## Examples

      iex> list_person_profiles()
      [%Profile{}, ...]

  """
  def list_person_profiles do
    Repo.all(Profile)
  end

  @doc """
  Gets a single profile.

  Raises `Ecto.NoResultsError` if the Profile does not exist.

  ## Examples

      iex> get_profile!(123)
      %Profile{}

      iex> get_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profile!(id), do: Repo.get!(Profile, id) |> Repo.preload([:links, :pics])

  @doc """
  Creates a profile.

  ## Examples

      iex> create_profile(%{field: value})
      {:ok, %Profile{}}

      iex> create_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profile(attrs \\ %{}) do
    %Profile{}
    |> Profile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profile.

  ## Examples

      iex> update_profile(profile, %{field: new_value})
      {:ok, %Profile{}}

      iex> update_profile(profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profile(%Profile{} = profile, attrs) do
    profile
    |> Profile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a profile.

  ## Examples

      iex> delete_profile(profile)
      {:ok, %Profile{}}

      iex> delete_profile(profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profile(%Profile{} = profile) do
    Repo.delete(profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profile changes.

  ## Examples

      iex> change_profile(profile)
      %Ecto.Changeset{data: %Profile{}}

  """

  # def change_profile(%Profile{} = profile) do
  #   Profile.changeset(profile, %{})
  # end

  # def change_profile(%PersonRegistration{} = profile) do
  #   PersonRegistration.changeset(profile, %{})
  # end

  def change_profile(%Profile{} = profile, attrs \\ %{}) do
    Profile.changeset(profile, attrs)
    |> cast_assoc(:links, with: &Link.changeset/2)
    |> cast_assoc(:pics, with: &Image.changeset/2)
  end

  # def change_profile(%PersonRegistration{} = profile, attrs) do
  #   PersonRegistration.changeset(profile, attrs)
  # end
end
