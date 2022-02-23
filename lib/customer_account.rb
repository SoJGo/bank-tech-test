# frozen_string_literal: true

require_relative 'bank_account'

class CustomerAccount
  def initialize(bank_account: BankAccount)
    @bank_account = bank_account.new
  end

  def deposit(amount)
    raise 'Please enter a positve amount of Pounds' unless vaild_amount?(amount)

    @bank_account.deposit(amount)
    "£#{format('%.2f', amount)} deposited. Thank you for banking with us."
  end

  def withdraw(amount)
    raise 'Please enter a positve amount of Pounds' unless vaild_amount?(amount)

    @bank_account.withdraw(amount)
    "£#{format('%.2f', amount)} withdrawn. Thank you for banking with us."
  end

  def statement
    @bank_account.statement
    'Thank you for banking with us.'
  end

  private

  def vaild_amount?(amount)
    (amount.is_a?(Float) || amount.is_a?(Integer)) &&
      amount.positive? && (amount * 100).round == (amount * 100).round(10)
  end
end
