defmodule ClimateCoolers.Profiles.Company.ProfileImages do
  @moduledoc """
  The Profiles.ProfileImage context.
  """

  import Ecto.Query, warn: false
  alias ClimateCoolers.Repo

  alias ClimateCoolers.Profiles.ProfileImages.ProfileImage

  @doc """
  Returns the list of company_profile_images.

  ## Examples

      iex> list_company_profile_images()
      [%ProfileImage{}, ...]

  """
  def list_company_profile_images do
    Repo.all(ProfileImage)
  end

  @doc """
  Gets a single company_profile_image.

  Raises `Ecto.NoResultsError` if the Company profile image does not exist.

  ## Examples

      iex> get_company_profile_image!(123)
      %ProfileImage{}

      iex> get_company_profile_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company_profile_image!(id), do: Repo.get!(ProfileImage, id)

  @doc """
  Creates a company_profile_image.

  ## Examples

      iex> create_company_profile_image(%{field: value})
      {:ok, %ProfileImage{}}

      iex> create_company_profile_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company_profile_image(attrs \\ %{}) do
    %ProfileImage{}
    |> ProfileImage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company_profile_image.

  ## Examples

      iex> update_company_profile_image(company_profile_image, %{field: new_value})
      {:ok, %ProfileImage{}}

      iex> update_company_profile_image(company_profile_image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company_profile_image(%ProfileImage{} = company_profile_image, attrs) do
    company_profile_image
    |> ProfileImage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company_profile_image.

  ## Examples

      iex> delete_company_profile_image(company_profile_image)
      {:ok, %ProfileImage{}}

      iex> delete_company_profile_image(company_profile_image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company_profile_image(%ProfileImage{} = company_profile_image) do
    Repo.delete(company_profile_image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company_profile_image changes.

  ## Examples

      iex> change_company_profile_image(company_profile_image)
      %Ecto.Changeset{data: %ProfileImage{}}

  """
  def change_company_profile_image(%ProfileImage{} = company_profile_image, attrs \\ %{}) do
    ProfileImage.changeset(company_profile_image, attrs)
  end
end
