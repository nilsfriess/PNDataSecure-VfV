defmodule ReportWeb.PageController do
  use ReportWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:page_title, "Übersicht")
    |> render("index.html")
  end
end
