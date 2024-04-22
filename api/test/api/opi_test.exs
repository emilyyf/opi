defmodule Api.OPITest do
  use Api.DataCase

  alias Api.OPI

  describe "transactions" do
    alias Api.OPI.Transaction

    import Api.OPIFixtures

    @invalid_attrs %{amount: nil, date: nil, description: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert OPI.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert OPI.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{amount: 42, date: ~N[2024-04-21 11:43:00], description: "some description"}

      assert {:ok, %Transaction{} = transaction} = OPI.create_transaction(valid_attrs)
      assert transaction.amount == 42
      assert transaction.date == ~N[2024-04-21 11:43:00]
      assert transaction.description == "some description"
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OPI.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{amount: 43, date: ~N[2024-04-22 11:43:00], description: "some updated description"}

      assert {:ok, %Transaction{} = transaction} = OPI.update_transaction(transaction, update_attrs)
      assert transaction.amount == 43
      assert transaction.date == ~N[2024-04-22 11:43:00]
      assert transaction.description == "some updated description"
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = OPI.update_transaction(transaction, @invalid_attrs)
      assert transaction == OPI.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = OPI.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> OPI.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = OPI.change_transaction(transaction)
    end
  end
end
