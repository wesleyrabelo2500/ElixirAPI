defmodule PrimeiroWeb.TarefaControllerTest do
  use PrimeiroWeb.ConnCase

  import Primeiro.PromFixtures

  @create_attrs %{afazer: "some afazer", pessoa: "some pessoa", descr: "some descr", praini: ~D[2023-11-29], prafin: ~D[2023-11-29], progre: "some progre", priorid: "some priorid", coment: "some coment"}
  @update_attrs %{afazer: "some updated afazer", pessoa: "some updated pessoa", descr: "some updated descr", praini: ~D[2023-11-30], prafin: ~D[2023-11-30], progre: "some updated progre", priorid: "some updated priorid", coment: "some updated coment"}
  @invalid_attrs %{afazer: nil, pessoa: nil, descr: nil, praini: nil, prafin: nil, progre: nil, priorid: nil, coment: nil}

  describe "index" do
    test "lists all tarefa", %{conn: conn} do
      conn = get(conn, ~p"/tarefa")
      assert html_response(conn, 200) =~ "Listing Tarefa"
    end
  end

  describe "new tarefa" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/tarefa/new")
      assert html_response(conn, 200) =~ "New Tarefa"
    end
  end

  describe "create tarefa" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/tarefa", tarefa: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/tarefa/#{id}"

      conn = get(conn, ~p"/tarefa/#{id}")
      assert html_response(conn, 200) =~ "Tarefa #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/tarefa", tarefa: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tarefa"
    end
  end

  describe "edit tarefa" do
    setup [:create_tarefa]

    test "renders form for editing chosen tarefa", %{conn: conn, tarefa: tarefa} do
      conn = get(conn, ~p"/tarefa/#{tarefa}/edit")
      assert html_response(conn, 200) =~ "Edit Tarefa"
    end
  end

  describe "update tarefa" do
    setup [:create_tarefa]

    test "redirects when data is valid", %{conn: conn, tarefa: tarefa} do
      conn = put(conn, ~p"/tarefa/#{tarefa}", tarefa: @update_attrs)
      assert redirected_to(conn) == ~p"/tarefa/#{tarefa}"

      conn = get(conn, ~p"/tarefa/#{tarefa}")
      assert html_response(conn, 200) =~ "some updated afazer"
    end

    test "renders errors when data is invalid", %{conn: conn, tarefa: tarefa} do
      conn = put(conn, ~p"/tarefa/#{tarefa}", tarefa: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tarefa"
    end
  end

  describe "delete tarefa" do
    setup [:create_tarefa]

    test "deletes chosen tarefa", %{conn: conn, tarefa: tarefa} do
      conn = delete(conn, ~p"/tarefa/#{tarefa}")
      assert redirected_to(conn) == ~p"/tarefa"

      assert_error_sent 404, fn ->
        get(conn, ~p"/tarefa/#{tarefa}")
      end
    end
  end

  defp create_tarefa(_) do
    tarefa = tarefa_fixture()
    %{tarefa: tarefa}
  end
end
