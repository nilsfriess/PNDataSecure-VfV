defmodule Report.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add(:name, :string)
      add(:prename, :string)
      add(:email, :string)
      add(:encrypted_password, :string)
      add(:street, :text)
      add(:city, :text)
      add(:phone, :string)
      add(:employer_id, references(:companies, on_delete: :nothing))

      timestamps()
    end

    create(unique_index(:employees, [:email]))
    create(index(:employees, [:employer_id]))
  end
end
