defmodule Primeiro.ProtFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Primeiro.Prot` context.
  """

  @doc """
  Generate a tarefas.
  """
  def tarefas_fixture(attrs \\ %{}) do
    {:ok, tarefas} =
      attrs
      |> Enum.into(%{
        afazer: "some afazer",
        comentarios: "some comentarios",
        pessoa: "some pessoa",
        progresso: "some progresso"
      })
      |> Primeiro.Prot.create_tarefas()

    tarefas
  end
end
