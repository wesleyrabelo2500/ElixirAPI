defmodule Primeiro.Prot.Tarefas do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tarefas" do
    field :pessoa, :string
    field :afazer, :string
    field :progresso, :string
    field :comentarios, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tarefas, attrs) do
    tarefas
    |> cast(attrs, [:pessoa, :afazer, :progresso, :comentarios])
    |> validate_required([:pessoa, :afazer, :progresso, :comentarios])
  end
end
