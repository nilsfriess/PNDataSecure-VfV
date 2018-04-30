defmodule Report.Record.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field(:categories, :string)
    field(:delete_deadline, :string)
    field(:department, :string)
    field(:legality, :string)
    field(:origin, :string)
    field(:purpose, :string)
    field(:receiver, :string)
    field(:sensitive_categories, :string)
    field(:serial_number, :integer)
    field(:title, :string)
    field(:type, :string)
    field(:record_id, :id)
    field(:contact_person_id, :id)

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [
      :title,
      :serial_number,
      :categories,
      :sensitive_categories,
      :delete_deadline,
      :origin,
      :department,
      :receiver,
      :purpose,
      :legality,
      :type
    ])
    |> validate_required([
      :title,
      :serial_number,
      :categories,
      :sensitive_categories,
      :delete_deadline,
      :origin,
      :department,
      :receiver,
      :purpose,
      :legality,
      :type
    ])
    |> unique_constraint(:serial_number)
  end
end
