defmodule Primeiro.PromTest do
  use Primeiro.DataCase

  alias Primeiro.Prom

  describe "tarefa" do
    alias Primeiro.Prom.Tarefa

    import Primeiro.PromFixtures

    @invalid_attrs %{afazer: nil, pessoa: nil, descr: nil, praini: nil, prafin: nil, progre: nil, priorid: nil, coment: nil}

    test "list_tarefa/0 returns all tarefa" do
      tarefa = tarefa_fixture()
      assert Prom.list_tarefa() == [tarefa]
    end

    test "get_tarefa!/1 returns the tarefa with given id" do
      tarefa = tarefa_fixture()
      assert Prom.get_tarefa!(tarefa.id) == tarefa
    end

    test "create_tarefa/1 with valid data creates a tarefa" do
      valid_attrs = %{afazer: "some afazer", pessoa: "some pessoa", descr: "some descr", praini: ~D[2023-11-29], prafin: ~D[2023-11-29], progre: "some progre", priorid: "some priorid", coment: "some coment"}

      assert {:ok, %Tarefa{} = tarefa} = Prom.create_tarefa(valid_attrs)
      assert tarefa.afazer == "some afazer"
      assert tarefa.pessoa == "some pessoa"
      assert tarefa.descr == "some descr"
      assert tarefa.praini == ~D[2023-11-29]
      assert tarefa.prafin == ~D[2023-11-29]
      assert tarefa.progre == "some progre"
      assert tarefa.priorid == "some priorid"
      assert tarefa.coment == "some coment"
    end

    test "create_tarefa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prom.create_tarefa(@invalid_attrs)
    end

    test "update_tarefa/2 with valid data updates the tarefa" do
      tarefa = tarefa_fixture()
      update_attrs = %{afazer: "some updated afazer", pessoa: "some updated pessoa", descr: "some updated descr", praini: ~D[2023-11-30], prafin: ~D[2023-11-30], progre: "some updated progre", priorid: "some updated priorid", coment: "some updated coment"}

      assert {:ok, %Tarefa{} = tarefa} = Prom.update_tarefa(tarefa, update_attrs)
      assert tarefa.afazer == "some updated afazer"
      assert tarefa.pessoa == "some updated pessoa"
      assert tarefa.descr == "some updated descr"
      assert tarefa.praini == ~D[2023-11-30]
      assert tarefa.prafin == ~D[2023-11-30]
      assert tarefa.progre == "some updated progre"
      assert tarefa.priorid == "some updated priorid"
      assert tarefa.coment == "some updated coment"
    end

    test "update_tarefa/2 with invalid data returns error changeset" do
      tarefa = tarefa_fixture()
      assert {:error, %Ecto.Changeset{}} = Prom.update_tarefa(tarefa, @invalid_attrs)
      assert tarefa == Prom.get_tarefa!(tarefa.id)
    end

    test "delete_tarefa/1 deletes the tarefa" do
      tarefa = tarefa_fixture()
      assert {:ok, %Tarefa{}} = Prom.delete_tarefa(tarefa)
      assert_raise Ecto.NoResultsError, fn -> Prom.get_tarefa!(tarefa.id) end
    end

    test "change_tarefa/1 returns a tarefa changeset" do
      tarefa = tarefa_fixture()
      assert %Ecto.Changeset{} = Prom.change_tarefa(tarefa)
    end
  end
end
