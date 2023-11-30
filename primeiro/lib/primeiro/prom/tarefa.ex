defmodule Primeiro.Prom.Tarefa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tarefa" do
    field :afazer, :string
    field :pessoa, :string
    field :descr, :string
    field :praini, :date
    field :prafin, :date
    field :progre, :string
    field :priorid, :string
    field :coment, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tarefa, attrs) do
    tarefa
    |> cast(attrs, [:afazer, :pessoa, :descr, :praini, :prafin, :progre, :priorid, :coment])
    |> validate_required([:afazer, :pessoa, :descr, :praini, :prafin, :progre, :priorid, :coment])
  end
end
