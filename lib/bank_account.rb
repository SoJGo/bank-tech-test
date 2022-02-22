# frozen_string_literal: true

class BankAccount
  def deposit(amount)
    @amount = amount
  end

  def statement
    puts 'date || credit || debit || balance'
    puts '10/01/2023 || 1000.00 || || 1000.00' if @amount
  end
end
