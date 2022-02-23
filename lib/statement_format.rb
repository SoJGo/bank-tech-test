# frozen_string_literal: true

class StatementFormat
  def initialize(balance:, date:, credit: nil, debit: nil)
    @balance = format_amount(balance)
    @credit = format_amount(credit)
    @debit = format_amount(debit)
    @date = format_date(date)
  end

  def line
    "#{@date} || #{@credit} #{@debit} || #{@balance}"
  end

  private

  def format_date(date)
    date.strftime('%d/%m/%Y')
  end

  def format_amount(amount)
    amount ? format('%#.2f', (amount / 100)).to_s : '||'
  end
end
