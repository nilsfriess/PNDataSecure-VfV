defmodule Report.AdministrationTest do
  use Report.DataCase

  alias Report.Administration
  alias Report.Administration.Company

  describe "companies and employees" do
    @valid_company_attrs %{
      address: "Musterstr. 1, 12345 Musterstadt",
      email: "info@company.com",
      name: "TestCompany",
      phone: "12345678"
    }

    @update_company_attrs %{
      address: "Musterstr. 2, 12345 Musterstadt",
      email: "admin@company.com",
      name: "NewTestCompany",
      phone: "87654321"
    }

    @invalid_company_attrs %{address: nil, email: nil, name: nil, phone: nil}

    def company_fixture(attrs \\ %{}) do
      company =
        attrs
        |> Enum.into(@valid_company_attrs)
        |> Administration.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture(@valid_company_attrs)

      assert [company] == Administration.list_companies()
    end

    test "get_company!/1 returns the company with the given id" do
      company = company_fixture(@valid_company_attrs)

      assert Administration.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company and its record of activities" do
      company = company_fixture(@valid_company_attrs)

      assert company.address == "Musterstr. 1, 12345 Musterstadt"
      assert company.email == "info@company.com"
      assert company.name == "TestCompany"
      assert company.phone == "12345678"
      assert Map.has_key?(company, :record)
    end

    test "create_company/1 with invalid data returns an error changset" do
      assert {:error, _} = Administration.create_company(@invalid_company_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, company} = Administration.update_company(company, @update_company_attrs)
      assert %Company{} = company
      assert company.address == "Musterstr. 2, 12345 Musterstadt"
      assert company.email == "admin@company.com"
      assert company.name == "NewTestCompany"
      assert company.phone == "87654321"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Administration.update_company(company, @invalid_company_attrs)

      assert company == Administration.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Administration.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Administration.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Administration.change_company(company)
    end

    alias Report.Administration.Employee

    @valid_employee_attrs %{
      name: "Doe",
      prename: "John",
      email: "jd@test.com",
      password: "12345678",
      street: "Teststr. 1",
      city: "12345 Teststadt",
      phone: "12345678"
    }

    @invalid_employee_attrs %{
      name: nil,
      prename: nil,
      email: nil,
      password: nil
    }

    @update_employee_attrs %{
      prename: "Jane",
      email: "jd@test.de",
      password: "87654321"
    }

    def employee_fixture(attrs \\ %{}) do
      company = company_fixture(@valid_company_attrs)

      {:ok, employee} =
        attrs
        |> Enum.into(@valid_employee_attrs)
        |> Administration.create_employee(company)

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture(@valid_employee_attrs)

      [db_employee] = Administration.list_employees()

      assert employee.city == db_employee.city
      assert employee.email == db_employee.email
      assert employee.name == db_employee.name
      assert employee.prename == db_employee.prename
      assert employee.phone == db_employee.phone
      assert employee.street == db_employee.street
      assert employee.company.name == db_employee.company.name
    end

    test "get_employee!/2 returns the employee with given id" do
      employee = employee_fixture()
      db_employee = Administration.get_employee!(employee.id)

      assert employee.city == db_employee.city
      assert employee.email == db_employee.email
      assert employee.name == db_employee.name
      assert employee.prename == db_employee.prename
      assert employee.phone == db_employee.phone
      assert employee.street == db_employee.street
    end

    test "create_employee/2 with valid data creates a employee" do
      company = company_fixture(@valid_company_attrs)

      assert {:ok, %Employee{} = employee} =
               Administration.create_employee(@valid_employee_attrs, company)

      assert employee.name == "Doe"
      assert employee.prename == "John"
      assert employee.email == "jd@test.com"
      assert employee.street == "Teststr. 1"
      assert employee.city == "12345 Teststadt"
      assert employee.phone == "12345678"
    end

    test "create_employee/2 does not store the plain text password but hashes it" do
      company = company_fixture(@valid_company_attrs)

      {:ok, employee} = Administration.create_employee(@valid_employee_attrs, company)
      db_employee = Administration.get_employee!(employee.id)

      refute db_employee.password
      assert Map.has_key?(db_employee, :encrypted_password)
      assert db_employee.encrypted_password != "12345678"
    end

    test "create_employee/2 with invalid data returns error changeset" do
      company = company_fixture(@valid_company_attrs)

      assert {:error, %Ecto.Changeset{}} =
               Administration.create_employee(@invalid_employee_attrs, company)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, employee} = Administration.update_employee(employee, @update_employee_attrs)
      assert %Employee{} = employee
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Administration.update_employee(employee, @invalid_employee_attrs)

      db_employee = Administration.get_employee!(employee.id)

      assert employee.city == db_employee.city
      assert employee.email == db_employee.email
      assert employee.name == db_employee.name
      assert employee.prename == db_employee.prename
      assert employee.phone == db_employee.phone
      assert employee.street == db_employee.street
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Administration.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Administration.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Administration.change_employee(employee)
    end
  end
end
