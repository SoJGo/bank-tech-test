# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:transaction_class) { class_double('Transaction') }
  let(:statement_class) { class_double('Statement') }
  let(:bank_account) { described_class.new(transaction: transaction_class) }

  describe '#deposit' do
    context 'when the user depostis 1000' do
      it 'creates a new transaction with credit 100000 and balance 100000' do
        expect(transaction_class).to receive(:new).with(credit: 100000, balance: 100000)
        bank_account.deposit(1000)
      end
    end
  end

  describe '#withdraw' do
    context 'when user withdraws 500' do
      it 'creates a new transaction with debit 50000 and balance -50000' do
        expect(transaction_class).to receive(:new).with(debit: 50000, balance: -50000)
        bank_account.withdraw(500)
      end
    end
  end

  describe '#statement' do
    it 'creates a new statement' do
      expect(statement_class).to receive(:new).with(Array)
      bank_account.statement(statement: statement_class)
    end
  end
end
