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

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :prename, :email, :encrypted_password, :street, :city, :phone])
    |> validate_required([:name, :prename, :email, :encrypted_password, :street, :city, :phone])
    |> unique_constraint(:email)
  end
end
