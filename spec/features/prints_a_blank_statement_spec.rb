# frozen_string_literal: true

require 'customer_account'

describe 'User prints a blank statement' do
  context 'when there are no transactions' do
    it 'prints only statement header' do
      my_account = CustomerAccount.new
      expect { my_account.statement }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end
