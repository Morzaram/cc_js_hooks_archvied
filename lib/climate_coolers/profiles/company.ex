defmodule ClimateCoolers.Profiles.Company do
  @moduledoc """
  The Profiles.Company context.
  """

  import Ecto.Query, warn: false
  alias ClimateCoolers.Repo

  alias ClimateCoolers.Profiles.Company.CompanyProfile

  @doc """
  Returns the list of company_profiles.

  ## Examples

      iex> list_company_profiles()
      [%CompanyProfile{}, ...]

  """
  def list_company_profiles do
    Repo.all(CompanyProfile)
  end

  @doc """
  Gets a single company_profile.

  Raises `Ecto.NoResultsError` if the Company profile does not exist.

  ## Examples

      iex> get_company_profile!(123)
      %CompanyProfile{}

      iex> get_company_profile!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company_profile!(id), do: Repo.get!(CompanyProfile, id)

  @doc """
  Creates a company_profile.

  ## Examples

      iex> create_company_profile(%{field: value})
      {:ok, %CompanyProfile{}}

      iex> create_company_profile(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company_profile(attrs \\ %{}) do
    %CompanyProfile{}
    |> CompanyProfile.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company_profile.

  ## Examples

      iex> update_company_profile(company_profile, %{field: new_value})
      {:ok, %CompanyProfile{}}

      iex> update_company_profile(company_profile, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company_profile(%CompanyProfile{} = company_profile, attrs) do
    company_profile
    |> CompanyProfile.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company_profile.

  ## Examples

      iex> delete_company_profile(company_profile)
      {:ok, %CompanyProfile{}}

      iex> delete_company_profile(company_profile)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company_profile(%CompanyProfile{} = company_profile) do
    Repo.delete(company_profile)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company_profile changes.

  ## Examples

      iex> change_company_profile(company_profile)
      %Ecto.Changeset{data: %CompanyProfile{}}

  """
  def change_company_profile(%CompanyProfile{} = company_profile, attrs \\ %{}) do
    CompanyProfile.changeset(company_profile, attrs)
  end
end
