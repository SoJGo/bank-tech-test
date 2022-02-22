# frozen_string_literal: true

class BankAccount
  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    @transactions.unshift([Time.now, amount, nil, @balance])
  end

  def withdraw(amount)
    @balance -= amount
    @transactions.unshift([Time.now, nil, amount, @balance])
  end

  def statement
    puts 'date || credit || debit || balance'
    print_transactions
  end

  private

  def print_transactions
    return if @transactions.empty?

    @transactions.each do |transaction|
      puts format_transaction(transaction)
    end
  end

  def format_transaction(transaction)
    "#{transaction[0].strftime('%d/%m/%Y')} || " +
      (transaction[1] ? "#{format('%.2f', transaction[1])} || " : '|| ') +
      (transaction[2] ? "#{format('%.2f', transaction[2])} || " : '|| ') +
      format('%.2f', transaction[3]).to_s
  end
end
