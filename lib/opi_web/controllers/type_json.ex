defmodule OpiWeb.TypeJSON do
  alias Opi.OPI.Type

  @doc """
  Renders a list of types.
  """
  def index(%{types: types}) do
    %{data: for(type <- types, do: data(type))}
  end

  @doc """
  Renders a single type.
  """
  def show(%{type: type}) do
    %{data: data(type)}
  end

  defp data(%Type{} = type) do
    %{
      id: type.id,
      description: type.description
    }
  end
end
