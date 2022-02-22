# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:my_account) { described_class.new }

  header = "date || credit || debit || balance\n"

  before do
    allow(Time).to receive(:now).and_return(Time.new(1999, 12, 31))
  end

  describe '#statement' do
    context 'when there have been 0 transactions' do
      it 'prints just a statement header' do
        expect { my_account.statement }.to output(header).to_stdout
      end
    end
  end

  describe '#deposit' do
    context 'when the user depostis 1000' do
      it 'shows 1000.00 credit and balance on their statement' do
        my_account.deposit(1000)
        expect { my_account.statement }.to output(
          "#{header}31/12/1999 || 1000.00 || || 1000.00\n"
        ).to_stdout
      end
    end

    context 'when user deposits 1000 then 2000' do
      it 'shows 2000.00 then 1000.00 in credit and 3000.00 then 1000.00 balance' do
        my_account.deposit(1000)
        my_account.deposit(2000)
        expect { my_account.statement }.to output(
          "#{header}31/12/1999 || 2000.00 || || 3000.00\n31/12/1999 || 1000.00 || || 1000.00\n"
        ).to_stdout
      end
    end
  end

  describe '#withdraw' do
    context 'when user deposits 1000 then withdraws 500' do
      it 'shows 500.00 in debit and 1500.00 balance at the top' do
        my_account.deposit(2000)
        my_account.withdraw(500)
        expect { my_account.statement }.to output(
          "#{header}31/12/1999 || || 500.00 || 1500.00\n31/12/1999 || 2000.00 || || 2000.00\n"
        ).to_stdout
      end
    end
  end
end
