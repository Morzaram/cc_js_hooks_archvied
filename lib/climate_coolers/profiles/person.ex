defmodule ClimateCoolers.Profiles.Person do
  @moduledoc """
  The Profiles.Person context.
  """
  import Ecto
  import Ecto.Query, warn: false
  alias ClimateCoolers.Repo

  alias ClimateCoolers.Profiles.Person.PersonProfile
  alias ClimateCoolers.Profiles.Person.ProfileImages.ProfileImage

  @doc """
  Returns the list of person_profiles.

  ## Examples

      iex> list_person_profiles()
      [%PersonProfile{}, ...]

  """
  def list_person_profiles do
    Repo.all(PersonProfile) |> Repo.preload(:profile_images)
  end

  @doc """
  Gets a single person_profile.

  Raises `Ecto.NoResultsError` if the Person profile does not exist.

  ## Examples

      iex> get_person_profile!(123)
      %PersonProfile{}

      iex> get_person_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_person_profile!(id), do: Repo.get!(PersonProfile, id) |> Repo.preload(:profile_images)

  @doc """
  Creates a person_profile.

  ## Examples

      iex> create_person_profile(%{field: value})
      {:ok, %PersonProfile{}}

      iex> create_person_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_person_profile(attrs \\ %{}) do
    %PersonProfile{}
    |> PersonProfile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a person_profile.

  ## Examples

      iex> update_person_profile(person_profile, %{field: new_value})
      {:ok, %PersonProfile{}}

      iex> update_person_profile(person_profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_person_profile(%PersonProfile{} = person_profile, attrs) do
    person_profile
    |> PersonProfile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a person_profile.

  ## Examples

      iex> delete_person_profile(person_profile)
      {:ok, %PersonProfile{}}

      iex> delete_person_profile(person_profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_person_profile(%PersonProfile{} = person_profile) do
    Repo.delete(person_profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking person_profile changes.

  ## Examples

      iex> change_person_profile(person_profile)
      %Ecto.Changeset{data: %PersonProfile{}}

  """
  def change_person_profile(%PersonProfile{} = person_profile, attrs \\ %{}) do
    PersonProfile.changeset(person_profile, attrs)
    |> Ecto.Changeset.put_assoc(:profile_images, [%ProfileImage{}])
  end
end
