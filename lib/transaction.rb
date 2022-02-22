# frozen_string_literal: true

class Transaction
  def initialize(balance:, credit: nil, debit: nil)
    @date = Time.now
    @balance = balance
    @credit = credit
    @debit = debit
  end

  def to_s
    "#{format_date} || " +
      (@credit ? "#{to_pounds(@credit)} || " : '|| ') +
      (@debit ? "#{to_pounds(@debit)} || " : '|| ') +
      to_pounds(@balance).to_s
  end

  private

  def format_date
    @date.strftime('%d/%m/%Y')
  end

  def to_pounds(amount)
    format('%#.2f', (amount / 100))
  end
end
