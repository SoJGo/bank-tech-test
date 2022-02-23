# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'
require_relative 'statement_format'

class BankAccount
  def initialize(transaction: Transaction)
    @transaction_log = []
    @balance = 0
    @transaction = transaction
  end

  def deposit(credit)
    @balance += (pence_credit = to_pence(credit))
    @transaction_log.unshift(@transaction.new(credit: pence_credit, balance: @balance))
  end

  def withdraw(debit)
    @balance -= (pence_debit = to_pence(debit))
    @transaction_log.unshift(@transaction.new(debit: pence_debit, balance: @balance))
  end

  def statement(statement: Statement, statement_format: StatementFormat)
    formatted_transactions = @transaction_log.map do |transaction|
      transaction.to_statement_format(statement_format)
    end
    statement.new(formatted_transactions)
  end

  private

  def to_pence(amount)
    (amount * 100).to_i
  end
end
