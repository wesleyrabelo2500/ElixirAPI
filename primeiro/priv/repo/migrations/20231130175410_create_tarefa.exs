defmodule Primeiro.Repo.Migrations.CreateTarefa do
  use Ecto.Migration

  def change do
    create table(:tarefa) do
      add :afazer, :string
      add :pessoa, :string
      add :descr, :string
      add :praini, :date
      add :prafin, :date
      add :progre, :string
      add :priorid, :string
      add :coment, :string

      timestamps(type: :utc_datetime)
    end
  end
end
