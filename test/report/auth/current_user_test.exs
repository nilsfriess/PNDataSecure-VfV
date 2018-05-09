defmodule Report.Auth.CurrentUserTest do
  use ReportWeb.ConnCase

  alias Report.Auth.CurrentUser
  alias Report.Administration

  import Report.Auth.Guardian
  alias Report.Auth.Pipeline

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

  test "conn gets assigned all the current resources if a user is logged in", %{conn: conn} do
    user = employee_fixture(@valid_employee_attrs)

    {:ok, token, _} = encode_and_sign(user, %{}, token_type: :access)

    conn =
      conn
      |> put_req_header("authorization", "bearer: " <> token)
      |> Pipeline.call(%{})
      |> CurrentUser.call(%{})

    assert conn.assigns[:current_user]
    assert conn.assigns[:current_company]
    assert conn.assigns[:current_record]
  end

  test "init does nothing" do
    opts = %{test: :test}
    assert CurrentUser.init(opts) == opts
  end
end
