defmodule ReportWeb.EntryController do
  use ReportWeb, :controller

  def create(conn, params) do
    IO.inspect(conn.assigns[:current_record])

    conn
    |> redirect(to: record_of_activities_path(conn, :list))
  end
end
