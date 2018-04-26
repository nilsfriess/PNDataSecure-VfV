defmodule Report.Repo.Migrations.AddDpoToCompany do
  use Ecto.Migration

  def change do
    alter table(:companies) do
      add(:dpo_id, references(:employees, on_delete: :nothing))
    end

    create(index(:companies, [:dpo_id]))
  end
end
