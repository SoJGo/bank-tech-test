# frozen_string_literal: true

require 'bank_account'

describe 'User deposits 1000' do
  it 'statement shows 1000.00 credit and balance' do
    my_account = BankAccount.new
    my_account.deposit(1000)
    expect { my_account.statement }.to output(
      "date || credit || debit || balance\n10/01/2023 || 1000.00 || || 1000.00\n"
    ).to_stdout
  end
end
