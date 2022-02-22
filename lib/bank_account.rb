# frozen_string_literal: true

require_relative 'transaction'

class BankAccount
  def initialize(transaction: Transaction)
    @transaction_log = []
    @balance = 0
    @transaction = transaction
  end

  def deposit(amount)
    pence_credit = to_pence(amount)
    @balance += pence_credit
    @transaction_log.unshift(@transaction.new(credit: pence_credit, balance: @balance))
    "#{amount} deposited. Thank you for banking with us."
  end

  def withdraw(amount)
    pence_debit = to_pence(amount)
    @balance -= pence_debit
    @transaction_log.unshift(@transaction.new(debit: pence_debit, balance: @balance))
    "#{amount} withdrawn. Thank you for banking with us."
  end

  def statement
    puts 'date || credit || debit || balance'
    print_transactions
    'Thank you for banking with us.'
  end

  private

  def print_transactions
    return if @transaction_log.empty?

    @transaction_log.each do |transaction|
      puts transaction.to_s
    end
  end

  def to_pence(amount)
    (amount * 100).to_i
  end
end
