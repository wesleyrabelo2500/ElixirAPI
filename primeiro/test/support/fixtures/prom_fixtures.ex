defmodule Primeiro.PromFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Primeiro.Prom` context.
  """

  @doc """
  Generate a tarefa.
  """
  def tarefa_fixture(attrs \\ %{}) do
    {:ok, tarefa} =
      attrs
      |> Enum.into(%{
        afazer: "some afazer",
        coment: "some coment",
        descr: "some descr",
        pessoa: "some pessoa",
        prafin: ~D[2023-11-29],
        praini: ~D[2023-11-29],
        priorid: "some priorid",
        progre: "some progre"
      })
      |> Primeiro.Prom.create_tarefa()

    tarefa
  end
end
