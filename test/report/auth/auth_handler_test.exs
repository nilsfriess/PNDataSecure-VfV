defmodule Report.Auth.ErrorHandlerTest do
  use ReportWeb.ConnCase

  alias Report.Auth.ErrorHandler

  test "auth_error redirects the user to the login page", %{conn: conn} do
    conn = ErrorHandler.auth_error(conn, %{}, %{})
    assert redirected_to(conn) == "/"
  end
end
