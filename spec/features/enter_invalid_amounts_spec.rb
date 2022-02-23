# frozen_string_literal: true

require 'customer_account'

describe 'Depositing money' do
  context 'when user enters a string' do
    it 'raises an error' do
      my_account = CustomerAccount.new
      expect{ my_account.deposit('banana') }.to raise_error(
        'Please enter a positve pounds amount'
      )
    end
  end

  context 'when user enters 3 decimal places' do
    it 'raises an error' do
      my_account = CustomerAccount.new
      expect{ my_account.deposit(1000.001) }.to raise_error(
        'Please enter a positve pounds amount'
      )
    end
  end
end

describe 'Withdrawing money' do
  context 'when user enters a string' do
    it 'raises an error' do
      my_account = CustomerAccount.new
      expect{ my_account.withdraw('banana') }.to raise_error(
        'Please enter a positve pounds amount'
      )
    end
  end

  context 'when user enters 3 decimal places' do
    it 'raises an error' do
      my_account = CustomerAccount.new
      expect{ my_account.withdraw(1000.001) }.to raise_error(
        'Please enter a positve pounds amount'
      )
    end
  end
end