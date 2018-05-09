defmodule ReportWeb.RecordOfActivitiesControllerTest do
  use ReportWeb.ConnCase

  import Report.Auth.Guardian

  alias Report.Administration

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

  def add_token_to_conn(conn) do
    user = employee_fixture(@valid_employee_attrs)

    {:ok, token, _} = encode_and_sign(user, %{}, token_type: :access)

    conn =
      conn
      |> put_req_header("authorization", "bearer: " <> token)

    conn
  end

  describe "record_of_activities" do
    test "GET /overview renders overview page and valid page title", %{conn: conn} do
      conn =
        conn
        |> add_token_to_conn()
        |> get("/overview")

      assert html_response(conn, 200) =~ "Übersicht"
    end

    test "GET /records renders a list of the available entries and a valid page title", %{
      conn: conn
    } do
      conn =
        conn
        |> add_token_to_conn()
        |> get("/records")

      assert html_response(conn, 200) =~ "Einträge"
    end
  end
end
