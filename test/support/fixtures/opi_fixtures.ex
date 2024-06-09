defmodule Opi.OPIFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Opi.OPI` context.
  """

  @doc """
  Generate a type.
  """
  def type_fixture(attrs \\ %{}) do
    {:ok, type} =
      attrs
      |> Enum.into(%{
        description: "some description"
      })
      |> Opi.OPI.create_type()

    type
  end

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        bank: "some bank",
        close_date: ~N[2024-06-08 19:54:00],
        name: "some name"
      })
      |> Opi.OPI.create_account()

    account
  end

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        date: ~N[2024-06-08 19:59:00],
        description: "some description",
        months: 42,
        value: 42
      })
      |> Opi.OPI.create_transaction()

    transaction
  end
end
