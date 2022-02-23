# frozen_string_literal: true

class Statement
  def initialize(transactions)
    @transactions = transactions
    print_header
    print_transactions
  end

  private

  def print_header
    puts 'date || credit || debit || balance'
  end

  def print_transactions
    return if @transactions.empty?

    puts @transactions.map(&:line).join("\n")
  end
end
