defmodule Primeiro.Prot do
  @moduledoc """
  The Prot context.
  """

  import Ecto.Query, warn: false
  alias Primeiro.Repo

  alias Primeiro.Prot.Tarefas

  @doc """
  Returns the list of tarefas.

  ## Examples

      iex> list_tarefas()
      [%Tarefas{}, ...]

  """
  def list_tarefas do
    Repo.all(Tarefas)
  end

  @doc """
  Gets a single tarefas.

  Raises `Ecto.NoResultsError` if the Tarefas does not exist.

  ## Examples

      iex> get_tarefas!(123)
      %Tarefas{}

      iex> get_tarefas!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tarefas!(id), do: Repo.get!(Tarefas, id)

  @doc """
  Creates a tarefas.

  ## Examples

      iex> create_tarefas(%{field: value})
      {:ok, %Tarefas{}}

      iex> create_tarefas(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tarefas(attrs \\ %{}) do
    %Tarefas{}
    |> Tarefas.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tarefas.

  ## Examples

      iex> update_tarefas(tarefas, %{field: new_value})
      {:ok, %Tarefas{}}

      iex> update_tarefas(tarefas, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tarefas(%Tarefas{} = tarefas, attrs) do
    tarefas
    |> Tarefas.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tarefas.

  ## Examples

      iex> delete_tarefas(tarefas)
      {:ok, %Tarefas{}}

      iex> delete_tarefas(tarefas)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tarefas(%Tarefas{} = tarefas) do
    Repo.delete(tarefas)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tarefas changes.

  ## Examples

      iex> change_tarefas(tarefas)
      %Ecto.Changeset{data: %Tarefas{}}

  """
  def change_tarefas(%Tarefas{} = tarefas, attrs \\ %{}) do
    Tarefas.changeset(tarefas, attrs)
  end
end
