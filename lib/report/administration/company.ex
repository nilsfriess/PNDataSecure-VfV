defmodule Report.Administration.Company do
  use Ecto.Schema
  import Ecto.Changeset

  alias Report.Administration.Employee
  alias Report.Record.RecordOfActivities

  schema "companies" do
    field(:address, :string)
    field(:email, :string)
    field(:name, :string)
    field(:phone, :string)

    has_many(:employees, Employee)

    has_one(:record, RecordOfActivities, on_delete: :delete_all)

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:address, :name, :email, :phone])
    |> validate_required([:address, :name, :email, :phone])
    |> unique_constraint(:email)
    |> foreign_key_constraint(:record_id)
  end
end
