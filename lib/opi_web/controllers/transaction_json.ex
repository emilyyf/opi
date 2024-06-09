defmodule OpiWeb.TransactionJSON do
  alias Opi.OPI.Transaction

  @doc """
  Renders a list of transactions.
  """
  def index(%{transactions: transactions}) do
    %{data: for(transaction <- transactions, do: data(transaction))}
  end

  @doc """
  Renders a single transaction.
  """
  def show(%{transaction: transaction}) do
    %{data: data(transaction)}
  end

  defp data(%Transaction{} = transaction) do
    %{
      id: transaction.id,
      description: transaction.description,
      date: transaction.date,
      value: transaction.value,
      months: transaction.months
    }
  end
end
