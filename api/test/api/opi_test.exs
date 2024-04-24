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

  describe "transactions" do
    alias Api.OPI.Transaction

    import Api.OPIFixtures

    @invalid_attrs %{amount: nil, date: nil, description: nil, type: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert OPI.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert OPI.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{amount: 42, date: ~N[2024-04-22 11:39:00], description: "some description", type: 42}

      assert {:ok, %Transaction{} = transaction} = OPI.create_transaction(valid_attrs)
      assert transaction.amount == 42
      assert transaction.date == ~N[2024-04-22 11:39:00]
      assert transaction.description == "some description"
      assert transaction.type == 42
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OPI.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{amount: 43, date: ~N[2024-04-23 11:39:00], description: "some updated description", type: 43}

      assert {:ok, %Transaction{} = transaction} = OPI.update_transaction(transaction, update_attrs)
      assert transaction.amount == 43
      assert transaction.date == ~N[2024-04-23 11:39:00]
      assert transaction.description == "some updated description"
      assert transaction.type == 43
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

  describe "types" do
    alias Api.OPI.Type

    import Api.OPIFixtures

    @invalid_attrs %{description: nil, id: nil}

    test "list_types/0 returns all types" do
      type = type_fixture()
      assert OPI.list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert OPI.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      valid_attrs = %{description: "some description", id: 42}

      assert {:ok, %Type{} = type} = OPI.create_type(valid_attrs)
      assert type.description == "some description"
      assert type.id == 42
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OPI.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      update_attrs = %{description: "some updated description", id: 43}

      assert {:ok, %Type{} = type} = OPI.update_type(type, update_attrs)
      assert type.description == "some updated description"
      assert type.id == 43
    end

    test "update_type/2 with invalid data returns error changeset" do
      type = type_fixture()
      assert {:error, %Ecto.Changeset{}} = OPI.update_type(type, @invalid_attrs)
      assert type == OPI.get_type!(type.id)
    end

    test "delete_type/1 deletes the type" do
      type = type_fixture()
      assert {:ok, %Type{}} = OPI.delete_type(type)
      assert_raise Ecto.NoResultsError, fn -> OPI.get_type!(type.id) end
    end

    test "change_type/1 returns a type changeset" do
      type = type_fixture()
      assert %Ecto.Changeset{} = OPI.change_type(type)
    end
  end
end
