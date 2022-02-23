# frozen_string_literal: true

require 'customer_account'

describe 'Depositing money' do
  context 'when user deposits 1000' do
    it 'statement shows 1000.00 credit and balance' do
      my_account = CustomerAccount.new
      allow(Time).to receive(:now).and_return(Time.new(2023, 01, 10))
      my_account.deposit(1000)
      expect { my_account.statement }.to output(
        "date || credit || debit || balance\n10/01/2023 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end

  context 'when user deposits 1000 then 2000' do
    it 'statement shows 2000.00/1000.00 in credit and 3000.00/1000.00 balance' do
      my_account = CustomerAccount.new
      allow(Time).to receive(:now).and_return(Time.new(2023, 01, 10))
      my_account.deposit(1000)
      allow(Time).to receive(:now).and_return(Time.new(2023, 01, 13))
      my_account.deposit(2000)
      expect { my_account.statement }.to output(
        "date || credit || debit || balance\n13/01/2023 || 2000.00 || || 3000.00\n" \
        "10/01/2023 || 1000.00 || || 1000.00\n"
      ).to_stdout
    end
  end
end
