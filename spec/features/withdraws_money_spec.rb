# frozen_string_literal: true

require 'bank_account'

describe 'Withdrawing money' do
  context 'when user withdraws 500 after 1000 and 2000 deposits' do
    it 'statement shows 500.00 in debit and 2500.00 balance at the top' do
      my_account = BankAccount.new
      allow(Time).to receive(:now).and_return(Time.new(2023, 01, 10))
      my_account.deposit(1000)
      allow(Time).to receive(:now).and_return(Time.new(2023, 01, 13))
      my_account.deposit(2000)
      allow(Time).to receive(:now).and_return(Time.new(2023, 01, 14))
      my_account.withdraw(500)
      expect { my_account.statement }.to output(
        "date || credit || debit || balance\n14/01/2023 || || 500.00 || 2500.00\n" \
        "13/01/2023 || 2000.00 || || 3000.00\n10/01/2023 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end
end
