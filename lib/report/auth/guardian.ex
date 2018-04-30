defmodule Report.Auth.Guardian do
  use Guardian, otp_app: :report

  alias Report.Administration

  def subject_for_token(user, _claims) do
    sub = to_string(user.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]

    user = Administration.get_employee!(id)

    {:ok, user}
  end
end
