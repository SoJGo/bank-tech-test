# frozen_string_literal: true

require 'bank_account'

describe 'User prints a blank statement' do
  it 'prints only statement header' do
    my_account = BankAccount.new
    expect { my_account.statement }.to output("date || credit || debit || balance\n").to_stdout
  end
end
