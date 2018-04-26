defmodule ReportWeb.PageController do
  use ReportWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
