defmodule OpiWeb.TypeController do
  use OpiWeb, :controller

  alias Opi.OPI
  alias Opi.OPI.Type

  action_fallback OpiWeb.FallbackController

  def index(conn, _params) do
    types = OPI.list_types()
    render(conn, :index, types: types)
  end

  def create(conn, %{"type" => type_params}) do
    with {:ok, %Type{} = type} <- OPI.create_type(type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/types/#{type}")
      |> render(:show, type: type)
    end
  end

  def show(conn, %{"id" => id}) do
    type = OPI.get_type!(id)
    render(conn, :show, type: type)
  end

  def update(conn, %{"id" => id, "type" => type_params}) do
    type = OPI.get_type!(id)

    with {:ok, %Type{} = type} <- OPI.update_type(type, type_params) do
      render(conn, :show, type: type)
    end
  end

  def delete(conn, %{"id" => id}) do
    type = OPI.get_type!(id)

    with {:ok, %Type{}} <- OPI.delete_type(type) do
      send_resp(conn, :no_content, "")
    end
  end
end
