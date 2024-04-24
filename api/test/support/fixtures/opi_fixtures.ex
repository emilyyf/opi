defmodule Api.OPIFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Api.OPI` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        amount: 42,
        date: ~N[2024-04-21 11:43:00],
        description: "some description"
      })
      |> Api.OPI.create_transaction()

    transaction
  end

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        amount: 42,
        date: ~N[2024-04-22 11:39:00],
        description: "some description",
        type: 42
      })
      |> Api.OPI.create_transaction()

    transaction
  end

  @doc """
  Generate a unique type id.
  """
  def unique_type_id, do: System.unique_integer([:positive])

  @doc """
  Generate a type.
  """
  def type_fixture(attrs \\ %{}) do
    {:ok, type} =
      attrs
      |> Enum.into(%{
        description: "some description",
        id: unique_type_id()
      })
      |> Api.OPI.create_type()

    type
  end
end
