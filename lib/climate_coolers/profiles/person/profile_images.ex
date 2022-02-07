defmodule ClimateCoolers.Profiles.Person.ProfileImages do
  @moduledoc """
  The Profiles.Person.ProfileImages context.
  """

  import Ecto.Query, warn: false
  alias ClimateCoolers.Repo

  alias ClimateCoolers.Profiles.Person.ProfileImages.ProfileImage

  @doc """
  Returns the list of person_profile_images.

  ## Examples

      iex> list_person_profile_images()
      [%ProfileImage{}, ...]

  """
  def list_person_profile_images do
    Repo.all(ProfileImage)
  end

  @doc """
  Gets a single person_profile_image.

  Raises `Ecto.NoResultsError` if the Person profile image does not exist.

  ## Examples

      iex> get_person_profile_image!(123)
      %ProfileImage{}

      iex> get_person_profile_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_person_profile_image!(id), do: Repo.get!(ProfileImage, id)

  @doc """
  Creates a person_profile_image.

  ## Examples

      iex> create_person_profile_image(%{field: value})
      {:ok, %ProfileImage{}}

      iex> create_person_profile_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_person_profile_image(attrs \\ %{}) do
    %ProfileImage{}
    |> ProfileImage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a person_profile_image.

  ## Examples

      iex> update_person_profile_image(person_profile_image, %{field: new_value})
      {:ok, %ProfileImage{}}

      iex> update_person_profile_image(person_profile_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_person_profile_image(%ProfileImage{} = person_profile_image, attrs) do
    person_profile_image
    |> ProfileImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a person_profile_image.

  ## Examples

      iex> delete_person_profile_image(person_profile_image)
      {:ok, %ProfileImage{}}

      iex> delete_person_profile_image(person_profile_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_person_profile_image(%ProfileImage{} = person_profile_image) do
    Repo.delete(person_profile_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking person_profile_image changes.

  ## Examples

      iex> change_person_profile_image(person_profile_image)
      %Ecto.Changeset{data: %ProfileImage{}}

  """
  def change_person_profile_image(%ProfileImage{} = person_profile_image, attrs \\ %{}) do
    ProfileImage.changeset(person_profile_image, attrs)
  end
end
