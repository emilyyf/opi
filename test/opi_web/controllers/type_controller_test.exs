defmodule OpiWeb.TypeControllerTest do
  use OpiWeb.ConnCase

  import Opi.OPIFixtures

  alias Opi.OPI.Type

  @create_attrs %{
    description: "some description"
  }
  @update_attrs %{
    description: "some updated description"
  }
  @invalid_attrs %{description: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all types", %{conn: conn} do
      conn = get(conn, ~p"/api/types")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create type" do
    test "renders type when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/types", type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/types/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/types", type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update type" do
    setup [:create_type]

    test "renders type when data is valid", %{conn: conn, type: %Type{id: id} = type} do
      conn = put(conn, ~p"/api/types/#{type}", type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/types/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, type: type} do
      conn = put(conn, ~p"/api/types/#{type}", type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete type" do
    setup [:create_type]

    test "deletes chosen type", %{conn: conn, type: type} do
      conn = delete(conn, ~p"/api/types/#{type}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/types/#{type}")
      end
    end
  end

  defp create_type(_) do
    type = type_fixture()
    %{type: type}
  end
end
