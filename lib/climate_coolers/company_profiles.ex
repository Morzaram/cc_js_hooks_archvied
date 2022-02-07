defmodule ClimateCoolers.CompanyProfiles do
  @moduledoc """
  The CompanyProfiles context.
  """
  import Ecto.Changeset
  import Ecto.Query, warn: false
  alias ClimateCoolers.Repo

  alias ClimateCoolers.CompanyProfiles.Profile
  alias ClimateCoolers.ProfileImages.Image
  alias ClimateCoolers.ProfileLink.Link

  @doc """
  Returns the list of company_profiles.

  ## Examples

      iex> list_company_profiles()
      [%Profile{}, ...]

  """
  def list_company_profiles do
    Repo.all(Profile)
  end

  @doc """
  Gets a single company_profile.

  Raises `Ecto.NoResultsError` if the Company profile does not exist.

  ## Examples

      iex> get_company_profile!(123)
      %Profile{}

      iex> get_company_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company_profile!(id), do: Repo.get!(Profile, id)

  @doc """
  Creates a company_profile.

  ## Examples

      iex> create_company_profile(%{field: value})
      {:ok, %Profile{}}

      iex> create_company_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company_profile(attrs \\ %{}) do
    %Profile{}
    |> Profile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company_profile.

  ## Examples

      iex> update_company_profile(company_profile, %{field: new_value})
      {:ok, %Profile{}}

      iex> update_company_profile(company_profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company_profile(%Profile{} = company_profile, attrs) do
    company_profile
    |> Profile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company_profile.

  ## Examples

      iex> delete_company_profile(company_profile)
      {:ok, %Profile{}}

      iex> delete_company_profile(company_profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company_profile(%Profile{} = company_profile) do
    Repo.delete(company_profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company_profile changes.

  ## Examples

      iex> change_company_profile(company_profile)
      %Ecto.Changeset{data: %Profile{}}

  """
  def change_company_profile(%Profile{} = company_profile, attrs \\ %{}) do
    Profile.changeset(company_profile, attrs)
  end

  alias ClimateCoolers.CompanyProfiles.Profile

  @doc """
  Returns the list of company_profiles.

  ## Examples

      iex> list_company_profiles()
      [%Profile{}, ...]

  """
  def list_company_profiles do
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
  def get_profile!(id), do: Repo.get!(Profile, id)

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
  def change_profile(%Profile{} = profile, attrs \\ %{}) do
    Profile.changeset(profile, attrs)
    |> put_assoc(:links, %Link{})
    |> put_assoc(:profile_pictures, %Image{})
  end
end
