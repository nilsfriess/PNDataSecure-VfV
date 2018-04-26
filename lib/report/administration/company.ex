defmodule Report.Administration.Company do
  use Ecto.Schema
  import Ecto.Changeset


  schema "companies" do
    field :address, :string
    field :email, :string
    field :name, :string
    field :phone, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:address, :name, :email, :phone])
    |> validate_required([:address, :name, :email, :phone])
    |> unique_constraint(:email)
  end
end
