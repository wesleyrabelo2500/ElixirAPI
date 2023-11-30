defmodule PrimeiroWeb.TarefaHTML do
  use PrimeiroWeb, :html

  embed_templates "tarefa_html/*"

  @doc """
  Renders a tarefa form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def tarefa_form(assigns)
end
