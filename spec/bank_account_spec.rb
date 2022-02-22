# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  let(:my_account) { described_class.new }

  describe '#statement' do
    context 'when there have been 0 transactions' do
      it 'prints just a statement header' do
        expect { my_account.statement }.to output("date || credit || debit || balance\n").to_stdout
      end
    end
  end

  describe '#deposit' do
    context 'when the user depostis 1000' do
      it 'shows 1000.00 credit and balance on their statement' do
        my_account.deposit(1000)
        expect { my_account.statement }.to output(
          "date || credit || debit || balance\n" \
          "10/01/2023 || 1000.00 || || 1000.00\n"
        ).to_stdout
      end
    end
  end
end
