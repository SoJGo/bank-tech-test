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
end
