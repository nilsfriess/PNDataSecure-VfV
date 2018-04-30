defmodule Report.Administration.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field(:city, :string)
    field(:email, :string)
    field(:encrypted_password, :string)
    field(:name, :string)
    field(:phone, :string)
    field(:prename, :string)
    field(:street, :string)
    field(:employer_id, :id)

    field(:password, :string, virtual: true)

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :prename, :email, :password, :street, :city, :phone])
    |> validate_required([:name, :prename, :email, :password])
    |> validate_length(:password, min: 8)
    |> put_password_hash()
    |> unique_constraint(:email)
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :encrypted_password, Comeonin.Argon2.hashpwsalt(password))

      _ ->
        changeset
    end
  end
end
