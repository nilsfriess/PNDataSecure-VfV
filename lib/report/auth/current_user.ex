defmodule Report.Auth.CurrentUser do
  import Plug.Conn
  import Guardian.Plug

  def init(opts), do: opts

  def call(conn, _opts) do
    IO.puts("Current resource")
    IO.inspect(current_resource(conn))

    case current_resource(conn) do
      nil ->
        conn

      current_user ->
        conn
        |> assign(:current_user, current_user)
        |> assign(:current_company, current_user.company)
        |> assign(:current_record, current_user.company.record)
    end
  end
end
