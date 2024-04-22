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
end
