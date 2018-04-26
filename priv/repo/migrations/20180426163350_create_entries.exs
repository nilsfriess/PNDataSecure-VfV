defmodule Report.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add(:title, :text)
      add(:serial_number, :integer)
      add(:categories, :text)
      add(:sensitive_categories, :text)
      add(:delete_deadline, :text)
      add(:origin, :text)
      add(:department, :text)
      add(:receiver, :text)
      add(:purpose, :text)
      add(:legality, :text)
      add(:type, :text)
      add(:record_id, references(:records_of_activities, on_delete: :nothing))
      add(:contact_person_id, references(:employees, on_delete: :nothing))

      timestamps()
    end

    create(unique_index(:entries, [:serial_number]))
    create(index(:entries, [:record_id]))
    create(index(:entries, [:contact_person_id]))
  end
end
