defmodule Report.Auth.ErrorHandler do
  alias ReportWeb.Router.Helpers, as: Routes

  def auth_error(conn, _, _opts) do
    # redirect the user to the login page when not authenticated
    conn
    |> Phoenix.Controller.redirect(to: Routes.session_path(conn, :index))
  end
end
