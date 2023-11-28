defmodule Primeiro.Repo.Migrations.CreateTarefas do
  use Ecto.Migration

  def change do
    create table(:tarefas) do
      add :pessoa, :string
      add :afazer, :string
      add :progresso, :string
      add :comentarios, :string

      timestamps(type: :utc_datetime)
    end
  end
end
