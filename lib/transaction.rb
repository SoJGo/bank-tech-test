# frozen_string_literal: true

class Transaction
  def initialize(balance:, credit: nil, debit: nil)
    @date = Time.now
    @balance = balance
    @credit = credit
    @debit = debit
  end

  def to_statement_format(statement_format)
    statement_format.new(
      balance: @balance, credit: @credit, debit: @debit, date: @date
    )
  end
end
