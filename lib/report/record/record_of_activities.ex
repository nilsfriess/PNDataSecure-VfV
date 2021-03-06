defmodule Report.Record.RecordOfActivities do
  use Ecto.Schema
  import Ecto.Changeset

  alias Report.Record.Entry
  alias Report.Administration.Company

  schema "records_of_activities" do
    field(:last_edit_date, :date)
    field(:last_edit_user_id, :id)
    field(:person_in_charge_id, :id)
    field(:proxy_of_person_in_charge_id, :id)
    field(:data_privacy_officer_id, :id)

    has_many(:entries, Entry, foreign_key: :record_id)

    belongs_to(:company, Company)

    timestamps()
  end

  @doc false
  def changeset(record_of_activities, attrs) do
    record_of_activities
    |> cast(attrs, [:last_edit_date])
  end
end
