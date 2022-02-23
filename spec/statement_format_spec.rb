# frozen_string_literal: true

require 'statement_format'

describe StatementFormat do
  let(:statement_format_credit) do
    described_class.new(
      balance: 2000, credit: 1000, date: Time.new(1999, 12, 31)
    )
  end
  let(:statement_format_debit) do
    described_class.new(
      balance: 4000, debit: 3000, date: Time.new(1999, 12, 31)
    )
  end

  describe '#line' do
    context 'when the debit is nil' do
      it 'formats the transaction line correctly' do
        expect(statement_format_credit.line).to eq(
          '31/12/1999 || 10.00 || || 20.00'
        )
      end
    end

    context 'when the credit is nil' do
      it 'formats the transaction line correctly' do
        expect(statement_format_debit.line).to eq(
          '31/12/1999 || || 30.00 || 40.00'
        )
      end
    end
  end
end
