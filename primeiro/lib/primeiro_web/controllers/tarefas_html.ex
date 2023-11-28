defmodule PrimeiroWeb.TarefasHTML do
  use PrimeiroWeb, :html

  embed_templates "tarefas_html/*"

  @doc """
  Renders a tarefas form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def tarefas_form(assigns)
end
