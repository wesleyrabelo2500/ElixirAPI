defmodule Primeiro.ProtTest do
  use Primeiro.DataCase

  alias Primeiro.Prot

  describe "tarefas" do
    alias Primeiro.Prot.Tarefas

    import Primeiro.ProtFixtures

    @invalid_attrs %{pessoa: nil, afazer: nil, progresso: nil, comentarios: nil}

    test "list_tarefas/0 returns all tarefas" do
      tarefas = tarefas_fixture()
      assert Prot.list_tarefas() == [tarefas]
    end

    test "get_tarefas!/1 returns the tarefas with given id" do
      tarefas = tarefas_fixture()
      assert Prot.get_tarefas!(tarefas.id) == tarefas
    end

    test "create_tarefas/1 with valid data creates a tarefas" do
      valid_attrs = %{pessoa: "some pessoa", afazer: "some afazer", progresso: "some progresso", comentarios: "some comentarios"}

      assert {:ok, %Tarefas{} = tarefas} = Prot.create_tarefas(valid_attrs)
      assert tarefas.pessoa == "some pessoa"
      assert tarefas.afazer == "some afazer"
      assert tarefas.progresso == "some progresso"
      assert tarefas.comentarios == "some comentarios"
    end

    test "create_tarefas/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prot.create_tarefas(@invalid_attrs)
    end

    test "update_tarefas/2 with valid data updates the tarefas" do
      tarefas = tarefas_fixture()
      update_attrs = %{pessoa: "some updated pessoa", afazer: "some updated afazer", progresso: "some updated progresso", comentarios: "some updated comentarios"}

      assert {:ok, %Tarefas{} = tarefas} = Prot.update_tarefas(tarefas, update_attrs)
      assert tarefas.pessoa == "some updated pessoa"
      assert tarefas.afazer == "some updated afazer"
      assert tarefas.progresso == "some updated progresso"
      assert tarefas.comentarios == "some updated comentarios"
    end

    test "update_tarefas/2 with invalid data returns error changeset" do
      tarefas = tarefas_fixture()
      assert {:error, %Ecto.Changeset{}} = Prot.update_tarefas(tarefas, @invalid_attrs)
      assert tarefas == Prot.get_tarefas!(tarefas.id)
    end

    test "delete_tarefas/1 deletes the tarefas" do
      tarefas = tarefas_fixture()
      assert {:ok, %Tarefas{}} = Prot.delete_tarefas(tarefas)
      assert_raise Ecto.NoResultsError, fn -> Prot.get_tarefas!(tarefas.id) end
    end

    test "change_tarefas/1 returns a tarefas changeset" do
      tarefas = tarefas_fixture()
      assert %Ecto.Changeset{} = Prot.change_tarefas(tarefas)
    end
  end
end
