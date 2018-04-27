defmodule Report.Record.RecordOfActivities do
  use Ecto.Schema
  import Ecto.Changeset

  schema "records_of_activities" do
    field(:last_edit_date, :date)
    field(:last_edit_user_id, :id)
    field(:person_in_charge_id, :id)
    field(:proxy_of_person_in_charge_id, :id)
    field(:data_privacy_officer_id, :id)

    timestamps()
  end

  @doc false
  def changeset(record_of_activities, attrs) do
    record_of_activities
    |> cast(attrs, [:last_edit_date])
    |> validate_required([:last_edit_date])
  end
end
