defmodule ReportWeb.SessionControllerTest do
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

  describe "session" do
    test "GET / renders login page when no user is logged in", %{conn: conn} do
      conn =
        conn
        |> get("/")

      assert html_response(conn, 200) =~ "Anmelden"
    end

    test "GET / redirects to /overview when user is logged in", %{conn: conn} do
      user = employee_fixture(@valid_employee_attrs)

      {:ok, token, _} = encode_and_sign(user, %{}, token_type: :access)

      conn =
        conn
        |> put_req_header("authorization", "bearer: " <> token)
        |> get("/")

      assert Report.Auth.Guardian.Plug.authenticated?(conn)
      assert redirected_to(conn) =~ "/overview"
    end

    test "POST /login redirects user to /overview if valid credentials provided", %{conn: conn} do
      user = employee_fixture(@valid_employee_attrs)
      credentials = %{"email" => user.email, "password" => user.password}

      conn =
        conn
        |> post("/login", employee: credentials)

      assert redirected_to(conn) =~ "/overview"
    end

    test "POST /login redirects user to '/' if invalid credentials provided", %{conn: conn} do
      # make sure that a user is available
      _user = employee_fixture(@valid_employee_attrs)
      credentials = %{"email" => "wrong", "password" => "wrong"}

      conn =
        conn
        |> post("/login", employee: credentials)

      assert redirected_to(conn) =~ "/"
    end

    test "GET /logout logs out the user and redirects to '/'", %{conn: conn} do
      user = employee_fixture(@valid_employee_attrs)

      {:ok, _token, _} = encode_and_sign(user, %{}, token_type: :access)

      conn =
        conn
        |> get("/logout")

      assert "/" = redir_path = redirected_to(conn)
      conn = get(recycle(conn), redir_path)
      refute Report.Auth.Guardian.Plug.authenticated?(conn)
    end
  end
end
