defmodule PrimeiroWeb.TarefasController do
  use PrimeiroWeb, :controller

  alias Primeiro.Prot
  alias Primeiro.Prot.Tarefas

  def index(conn, _params) do
    tarefas = Prot.list_tarefas()
    render(conn, :index, tarefas_collection: tarefas)
  end

  def new(conn, _params) do
    changeset = Prot.change_tarefas(%Tarefas{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"tarefas" => tarefas_params}) do
    case Prot.create_tarefas(tarefas_params) do
      {:ok, tarefas} ->
        conn
        |> put_flash(:info, "Tarefas created successfully.")
        |> redirect(to: ~p"/tarefas/#{tarefas}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tarefas = Prot.get_tarefas!(id)
    render(conn, :show, tarefas: tarefas)
  end

  def edit(conn, %{"id" => id}) do
    tarefas = Prot.get_tarefas!(id)
    changeset = Prot.change_tarefas(tarefas)
    render(conn, :edit, tarefas: tarefas, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tarefas" => tarefas_params}) do
    tarefas = Prot.get_tarefas!(id)

    case Prot.update_tarefas(tarefas, tarefas_params) do
      {:ok, tarefas} ->
        conn
        |> put_flash(:info, "Tarefas updated successfully.")
        |> redirect(to: ~p"/tarefas/#{tarefas}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, tarefas: tarefas, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tarefas = Prot.get_tarefas!(id)
    {:ok, _tarefas} = Prot.delete_tarefas(tarefas)

    conn
    |> put_flash(:info, "Tarefas deleted successfully.")
    |> redirect(to: ~p"/tarefas")
  end
end
