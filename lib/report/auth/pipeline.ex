defmodule Report.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :report,
    error_handler: Report.Auth.ErrorHandler,
    module: Report.Auth.Guardian

  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})

  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})

  plug(Guardian.Plug.LoadResource, allow_blank: true)
end
