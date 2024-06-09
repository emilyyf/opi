defmodule Opi.OPITest do
  use Opi.DataCase

  alias Opi.OPI

  describe "types" do
    alias Opi.OPI.Type

    import Opi.OPIFixtures

    @invalid_attrs %{description: nil}

    test "list_types/0 returns all types" do
      type = type_fixture()
      assert OPI.list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert OPI.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      valid_attrs = %{description: "some description"}

      assert {:ok, %Type{} = type} = OPI.create_type(valid_attrs)
      assert type.description == "some description"
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OPI.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      update_attrs = %{description: "some updated description"}

      assert {:ok, %Type{} = type} = OPI.update_type(type, update_attrs)
      assert type.description == "some updated description"
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

  describe "accounts" do
    alias Opi.OPI.Account

    import Opi.OPIFixtures

    @invalid_attrs %{bank: nil, close_date: nil, name: nil}

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert OPI.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert OPI.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      valid_attrs = %{bank: "some bank", close_date: ~N[2024-06-08 19:54:00], name: "some name"}

      assert {:ok, %Account{} = account} = OPI.create_account(valid_attrs)
      assert account.bank == "some bank"
      assert account.close_date == ~N[2024-06-08 19:54:00]
      assert account.name == "some name"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OPI.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      update_attrs = %{bank: "some updated bank", close_date: ~N[2024-06-09 19:54:00], name: "some updated name"}

      assert {:ok, %Account{} = account} = OPI.update_account(account, update_attrs)
      assert account.bank == "some updated bank"
      assert account.close_date == ~N[2024-06-09 19:54:00]
      assert account.name == "some updated name"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = OPI.update_account(account, @invalid_attrs)
      assert account == OPI.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = OPI.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> OPI.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = OPI.change_account(account)
    end
  end

  describe "transactions" do
    alias Opi.OPI.Transaction

    import Opi.OPIFixtures

    @invalid_attrs %{date: nil, description: nil, months: nil, value: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert OPI.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert OPI.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{date: ~N[2024-06-08 19:59:00], description: "some description", months: 42, value: 42}

      assert {:ok, %Transaction{} = transaction} = OPI.create_transaction(valid_attrs)
      assert transaction.date == ~N[2024-06-08 19:59:00]
      assert transaction.description == "some description"
      assert transaction.months == 42
      assert transaction.value == 42
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OPI.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{date: ~N[2024-06-09 19:59:00], description: "some updated description", months: 43, value: 43}

      assert {:ok, %Transaction{} = transaction} = OPI.update_transaction(transaction, update_attrs)
      assert transaction.date == ~N[2024-06-09 19:59:00]
      assert transaction.description == "some updated description"
      assert transaction.months == 43
      assert transaction.value == 43
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
