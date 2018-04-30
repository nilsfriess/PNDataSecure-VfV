defmodule Report.Auth do
  import Ecto.Query

  alias Comeonin.Argon2
  alias Report.Repo
  alias Report.Administration.Employee

  def authenticate_user(email, password) do
    query = from(e in Employee, where: e.email == ^email)

    Repo.one(query)
    |> check_password(password)
  end

  defp check_password(nil, _) do
    {:error, "Falscher Benutzername oder falsches Passwort"}
  end

  defp check_password(user, password) do
    case Argon2.check_pass(user, password) do
      {:ok, user} -> {:ok, user}
      {:error, _} -> {:error, "Falscher Benutzername oder falsches Passwort"}
    end
  end
end
