defmodule PrimeiroWeb.TarefaController do
  use PrimeiroWeb, :controller

  alias Primeiro.Prom
  alias Primeiro.Prom.Tarefa

  def index(conn, _params) do
    tarefa = Prom.list_tarefa()
    render(conn, :index, tarefa_collection: tarefa)
  end

  def new(conn, _params) do
    changeset = Prom.change_tarefa(%Tarefa{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"tarefa" => tarefa_params}) do
    case Prom.create_tarefa(tarefa_params) do
      {:ok, tarefa} ->
        conn
        |> put_flash(:info, "Tarefa created successfully.")
        |> redirect(to: ~p"/tarefa/#{tarefa}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tarefa = Prom.get_tarefa!(id)
    render(conn, :show, tarefa: tarefa)
  end

  def edit(conn, %{"id" => id}) do
    tarefa = Prom.get_tarefa!(id)
    changeset = Prom.change_tarefa(tarefa)
    render(conn, :edit, tarefa: tarefa, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tarefa" => tarefa_params}) do
    tarefa = Prom.get_tarefa!(id)

    case Prom.update_tarefa(tarefa, tarefa_params) do
      {:ok, tarefa} ->
        conn
        |> put_flash(:info, "Tarefa updated successfully.")
        |> redirect(to: ~p"/tarefa/#{tarefa}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, tarefa: tarefa, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tarefa = Prom.get_tarefa!(id)
    {:ok, _tarefa} = Prom.delete_tarefa(tarefa)

    conn
    |> put_flash(:info, "Tarefa deleted successfully.")
    |> redirect(to: ~p"/tarefa")
  end
end
