defmodule ClimateCoolers.Profiles.CompanyTest do
  use ClimateCoolers.DataCase

  alias ClimateCoolers.Profiles.Company

  describe "companies" do
    alias ClimateCoolers.Profiles.Company.Company

    import ClimateCoolers.Profiles.CompanyFixtures

    @invalid_attrs %{description: nil, established_in: nil, name: nil, url: nil}

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Company.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Company.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      valid_attrs = %{description: "some description", established_in: ~D[2022-02-06], name: "some name", url: "some url"}

      assert {:ok, %Company{} = company} = Company.create_company(valid_attrs)
      assert company.description == "some description"
      assert company.established_in == ~D[2022-02-06]
      assert company.name == "some name"
      assert company.url == "some url"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      update_attrs = %{description: "some updated description", established_in: ~D[2022-02-07], name: "some updated name", url: "some updated url"}

      assert {:ok, %Company{} = company} = Company.update_company(company, update_attrs)
      assert company.description == "some updated description"
      assert company.established_in == ~D[2022-02-07]
      assert company.name == "some updated name"
      assert company.url == "some updated url"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_company(company, @invalid_attrs)
      assert company == Company.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Company.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Company.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Company.change_company(company)
    end
  end

  describe "company_profiles" do
    alias ClimateCoolers.Profiles.Company.CompanyProfile

    import ClimateCoolers.Profiles.CompanyFixtures

    @invalid_attrs %{description: nil, established_in: nil, name: nil, url: nil}

    test "list_company_profiles/0 returns all company_profiles" do
      company_profile = company_profile_fixture()
      assert Company.list_company_profiles() == [company_profile]
    end

    test "get_company_profile!/1 returns the company_profile with given id" do
      company_profile = company_profile_fixture()
      assert Company.get_company_profile!(company_profile.id) == company_profile
    end

    test "create_company_profile/1 with valid data creates a company_profile" do
      valid_attrs = %{description: "some description", established_in: ~D[2022-02-06], name: "some name", url: "some url"}

      assert {:ok, %CompanyProfile{} = company_profile} = Company.create_company_profile(valid_attrs)
      assert company_profile.description == "some description"
      assert company_profile.established_in == ~D[2022-02-06]
      assert company_profile.name == "some name"
      assert company_profile.url == "some url"
    end

    test "create_company_profile/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_company_profile(@invalid_attrs)
    end

    test "update_company_profile/2 with valid data updates the company_profile" do
      company_profile = company_profile_fixture()
      update_attrs = %{description: "some updated description", established_in: ~D[2022-02-07], name: "some updated name", url: "some updated url"}

      assert {:ok, %CompanyProfile{} = company_profile} = Company.update_company_profile(company_profile, update_attrs)
      assert company_profile.description == "some updated description"
      assert company_profile.established_in == ~D[2022-02-07]
      assert company_profile.name == "some updated name"
      assert company_profile.url == "some updated url"
    end

    test "update_company_profile/2 with invalid data returns error changeset" do
      company_profile = company_profile_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_company_profile(company_profile, @invalid_attrs)
      assert company_profile == Company.get_company_profile!(company_profile.id)
    end

    test "delete_company_profile/1 deletes the company_profile" do
      company_profile = company_profile_fixture()
      assert {:ok, %CompanyProfile{}} = Company.delete_company_profile(company_profile)
      assert_raise Ecto.NoResultsError, fn -> Company.get_company_profile!(company_profile.id) end
    end

    test "change_company_profile/1 returns a company_profile changeset" do
      company_profile = company_profile_fixture()
      assert %Ecto.Changeset{} = Company.change_company_profile(company_profile)
    end
  end
end
