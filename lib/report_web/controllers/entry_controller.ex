defmodule ReportWeb.EntryController do
  use ReportWeb, :controller

  alias Report.Record

  def create(conn, params) do
    IO.inspect(params)
    current_record = conn.assigns[:current_record]

    Record.create_entry(params, current_record)

    conn
    |> redirect(to: record_of_activities_path(conn, :list))
  end
end
