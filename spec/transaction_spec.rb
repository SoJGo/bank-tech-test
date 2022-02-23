# frozen_string_literal: true

require 'transaction'

describe Transaction do
  let(:statement_format_class) { class_double('StatementFormat') }
  let(:transaction) { described_class.new(balance: 1000, credit: 1000) }

  describe '#to_statement_format' do
    it 'creates a new StatementFormat instance' do
      allow(Time).to receive(:now).and_return(Time.new(1999, 12, 31))
      expect(statement_format_class).to receive(:new).with(
        balance: 1000, credit: 1000, debit: nil, date: Time.new(1999, 12, 31)
      )
      transaction.to_statement_format(statement_format_class)
    end
  end
end
