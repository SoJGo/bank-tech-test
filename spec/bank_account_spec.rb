# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:transaction_class) { class_double('Transaction') }
  let(:my_account) { described_class.new(transaction: transaction_class) }
  let(:header) { "date || credit || debit || balance\n" }

  describe '#statement' do
    it 'calls to print the transactions' do
      expect(my_account).to receive(:print_transactions)
      my_account.statement
    end

    context 'when there have been 0 transactions' do
      it 'prints just a statement header' do
        expect { my_account.statement }.to output(header).to_stdout
      end
    end
  end

  describe '#deposit' do
    context 'when the user depostis 1000' do
      it 'creates a new transaction with credit 100000 and balance 100000' do
        expect(transaction_class).to receive(:new).with(credit: 100000, balance: 100000)
        my_account.deposit(1000)
      end
    end
  end

  describe '#withdraw' do
    context 'when user withdraws 500' do
      it 'creates a new transaction with debit 50000 and balance 150000' do
        expect(transaction_class).to receive(:new).with(debit: 50000, balance: -50000)
        my_account.withdraw(500)
      end
    end
  end
end
