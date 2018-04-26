defmodule Report.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :address, :text
      add :name, :text
      add :email, :string
      add :phone, :string

      timestamps()
    end

    create unique_index(:companies, [:email])
  end
end
