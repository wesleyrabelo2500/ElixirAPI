defmodule PrimeiroWeb.TarefasControllerTest do
  use PrimeiroWeb.ConnCase

  import Primeiro.ProtFixtures

  @create_attrs %{pessoa: "some pessoa", afazer: "some afazer", progresso: "some progresso", comentarios: "some comentarios"}
  @update_attrs %{pessoa: "some updated pessoa", afazer: "some updated afazer", progresso: "some updated progresso", comentarios: "some updated comentarios"}
  @invalid_attrs %{pessoa: nil, afazer: nil, progresso: nil, comentarios: nil}

  describe "index" do
    test "lists all tarefas", %{conn: conn} do
      conn = get(conn, ~p"/tarefas")
      assert html_response(conn, 200) =~ "Listing Tarefas"
    end
  end

  describe "new tarefas" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/tarefas/new")
      assert html_response(conn, 200) =~ "New Tarefas"
    end
  end

  describe "create tarefas" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/tarefas", tarefas: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/tarefas/#{id}"

      conn = get(conn, ~p"/tarefas/#{id}")
      assert html_response(conn, 200) =~ "Tarefas #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/tarefas", tarefas: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tarefas"
    end
  end

  describe "edit tarefas" do
    setup [:create_tarefas]

    test "renders form for editing chosen tarefas", %{conn: conn, tarefas: tarefas} do
      conn = get(conn, ~p"/tarefas/#{tarefas}/edit")
      assert html_response(conn, 200) =~ "Edit Tarefas"
    end
  end

  describe "update tarefas" do
    setup [:create_tarefas]

    test "redirects when data is valid", %{conn: conn, tarefas: tarefas} do
      conn = put(conn, ~p"/tarefas/#{tarefas}", tarefas: @update_attrs)
      assert redirected_to(conn) == ~p"/tarefas/#{tarefas}"

      conn = get(conn, ~p"/tarefas/#{tarefas}")
      assert html_response(conn, 200) =~ "some updated pessoa"
    end

    test "renders errors when data is invalid", %{conn: conn, tarefas: tarefas} do
      conn = put(conn, ~p"/tarefas/#{tarefas}", tarefas: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tarefas"
    end
  end

  describe "delete tarefas" do
    setup [:create_tarefas]

    test "deletes chosen tarefas", %{conn: conn, tarefas: tarefas} do
      conn = delete(conn, ~p"/tarefas/#{tarefas}")
      assert redirected_to(conn) == ~p"/tarefas"

      assert_error_sent 404, fn ->
        get(conn, ~p"/tarefas/#{tarefas}")
      end
    end
  end

  defp create_tarefas(_) do
    tarefas = tarefas_fixture()
    %{tarefas: tarefas}
  end
end
