defmodule Report.AdministrationTest do
  use Report.DataCase

  alias Report.Administration

  describe "companies" do
    alias Report.Administration.Company

    @valid_attrs %{address: "some address", email: "some email", name: "some name", phone: "some phone"}
    @update_attrs %{address: "some updated address", email: "some updated email", name: "some updated name", phone: "some updated phone"}
    @invalid_attrs %{address: nil, email: nil, name: nil, phone: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Administration.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Administration.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Administration.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Administration.create_company(@valid_attrs)
      assert company.address == "some address"
      assert company.email == "some email"
      assert company.name == "some name"
      assert company.phone == "some phone"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Administration.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, company} = Administration.update_company(company, @update_attrs)
      assert %Company{} = company
      assert company.address == "some updated address"
      assert company.email == "some updated email"
      assert company.name == "some updated name"
      assert company.phone == "some updated phone"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Administration.update_company(company, @invalid_attrs)
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
  end

  describe "employees" do
    alias Report.Administration.Employee

    @valid_attrs %{city: "some city", email: "some email", encrypted_password: "some encrypted_password", name: "some name", phone: "some phone", prename: "some prename", street: "some street"}
    @update_attrs %{city: "some updated city", email: "some updated email", encrypted_password: "some updated encrypted_password", name: "some updated name", phone: "some updated phone", prename: "some updated prename", street: "some updated street"}
    @invalid_attrs %{city: nil, email: nil, encrypted_password: nil, name: nil, phone: nil, prename: nil, street: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Administration.create_employee()

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Administration.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Administration.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = Administration.create_employee(@valid_attrs)
      assert employee.city == "some city"
      assert employee.email == "some email"
      assert employee.encrypted_password == "some encrypted_password"
      assert employee.name == "some name"
      assert employee.phone == "some phone"
      assert employee.prename == "some prename"
      assert employee.street == "some street"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Administration.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, employee} = Administration.update_employee(employee, @update_attrs)
      assert %Employee{} = employee
      assert employee.city == "some updated city"
      assert employee.email == "some updated email"
      assert employee.encrypted_password == "some updated encrypted_password"
      assert employee.name == "some updated name"
      assert employee.phone == "some updated phone"
      assert employee.prename == "some updated prename"
      assert employee.street == "some updated street"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Administration.update_employee(employee, @invalid_attrs)
      assert employee == Administration.get_employee!(employee.id)
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
