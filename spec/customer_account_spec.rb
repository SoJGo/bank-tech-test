# frozen_string_literal: true

require 'customer_account'

describe CustomerAccount do
  let(:bank_account_class) { class_double('BankAccount') }
  let(:bank_account) { instance_double('BankAccount') }
  let(:my_account) { described_class.new(bank_account: bank_account_class) }

  before do
    allow(bank_account_class).to receive(:new).and_return(bank_account)
  end

  describe '#deposit' do
    context 'when the user depostis 1000' do
      it 'deposit is called on bank account with 1000' do
        expect(bank_account).to receive(:deposit).with(1000)
        my_account.deposit(1000)
      end
    end

    context 'when the user enters a string' do
      it 'raises an error' do
        expect { my_account.deposit('banana') }.to raise_error(
          'Please enter a positve amount of Pounds'
        )
      end
    end

    context 'when the user enters 3 decimal places' do
      it 'raises an error' do
        expect { my_account.deposit(100.001) }.to raise_error(
          'Please enter a positve amount of Pounds'
        )
      end
    end
  end

  describe '#withdraw' do
    context 'when the user withdraws 500' do
      it 'deposit is called on bank account with 500' do
        expect(bank_account).to receive(:withdraw).with(500)
        my_account.withdraw(500)
      end
    end

    context 'when the user enters a string' do
      it 'raises an error' do
        expect { my_account.withdraw('banana') }.to raise_error(
          'Please enter a positve amount of Pounds'
        )
      end
    end

    context 'when the user enters 3 decimal places' do
      it 'raises an error' do
        expect { my_account.withdraw(100.001) }.to raise_error(
          'Please enter a positve amount of Pounds'
        )
      end
    end
  end

  describe '#statement' do
    it 'statement is called on bank account' do
      expect(bank_account).to receive(:statement)
      my_account.statement
    end
  end
end
