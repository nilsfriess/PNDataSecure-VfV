defmodule Report.Repo.Migrations.CreateRecordsOfActivities do
  use Ecto.Migration

  def change do
    create table(:records_of_activities) do
      add(:last_edit_date, :date)
      add(:last_edit_user_id, references(:employees, on_delete: :nothing))
      add(:person_in_charge_id, references(:employees, on_delete: :nothing))
      add(:proxy_of_person_in_charge_id, references(:employees, on_delete: :nothing))
      add(:data_privacy_officer_id, references(:employees, on_delete: :nothing))

      timestamps()
    end

    create(index(:records_of_activities, [:last_edit_user_id]))
    create(index(:records_of_activities, [:person_in_charge_id]))
    create(index(:records_of_activities, [:proxy_of_person_in_charge_id]))
    create(index(:records_of_activities, [:data_privacy_officer_id]))
  end
end
