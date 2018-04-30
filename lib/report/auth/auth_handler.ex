defmodule Report.Auth.ErrorHandler do
  import Plug.Conn
  alias ReportWeb.Router.Helpers, as: Routes

  def auth_error(conn, {type, _reason}, _opts) do
    body = to_string(type)

    # conn
    # |> put_resp_content_type("text/plain")
    # |> send_resp(401, body)

    # redirect the user to the login page when not authenticated
    conn
    |> Phoenix.Controller.redirect(to: Routes.session_path(conn, :index))
  end
end
