defmodule ReportWeb.CompanyControllerTest do
  use ReportWeb.ConnCase

  describe "session" do
    @valid_company_attrs %{
      address: "Musterstr. 1, 12345 Musterstadt",
      email: "info@company.com",
      name: "TestCompany",
      phone: "12345678"
    }

    def company_fixture(attrs \\ %{}) do
      company =
        attrs
        |> Enum.into(@valid_company_attrs)
        |> Administration.create_company()

      company
    end

    @valid_employee_attrs %{
      name: "Doe",
      prename: "John",
      email: "jd@test.com",
      password: "12345678",
      street: "Teststr. 1",
      city: "12345 Teststadt",
      phone: "12345678"
    }

    def employee_fixture(attrs \\ %{}) do
      company = company_fixture(@valid_company_attrs)

      {:ok, employee} =
        attrs
        |> Enum.into(@valid_employee_attrs)
        |> Administration.create_employee(company)

      employee
    end

    test "renders login page when no user is logged in", %{conn: conn} do
      employee = employee_fixture(@valid_employee_attrs)

      conn = guardian_login(employee)

      IO.inspect(conn)

      assert html_response(conn, 200) =~ "Anmelden"
    end
  end
end
