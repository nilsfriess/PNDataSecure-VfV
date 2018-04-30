defmodule ReportWeb.SessionController do
  use ReportWeb, :controller

  plug(:put_layout, "login_layout.html")

  alias Report.Auth
  alias Report.Administration
  alias Report.Administration.Employee

  def index(conn, _params) do
    changeset = Administration.change_employee(%Employee{})

    user = Guardian.Plug.current_resource(conn)

    IO.inspect(conn)

    if user != nil do
      conn
      |> redirect(to: record_of_activities_path(conn, :index))
    else
      conn
      |> render("login.html", changeset: changeset)
    end
  end

  def login(conn, %{"employee" => %{"email" => email, "password" => password}}) do
    Auth.authenticate_user(email, password)
    |> login_reply(conn)
  end

  defp login_reply({:error, error}, conn) do
    conn
    |> put_flash(:error, error)
    |> redirect(to: "/")
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> put_flash(:success, "User logged in")
    |> Report.Auth.Guardian.Plug.sign_in(user)
    |> redirect(to: "/")
  end

  def logout(conn, _params) do
    conn
    |> Report.Auth.Guardian.Plug.sign_out()
    |> redirect(to: session_path(conn, :index))
  end
end
