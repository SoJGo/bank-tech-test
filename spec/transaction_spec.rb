# frozen_string_literal: true

require 'transaction'

describe Transaction do
  describe '#to_s' do
    context 'when the transaction is positive' do
      it 'returns information in a statement format' do
        allow(Time).to receive(:now).and_return(Time.new(1999, 12, 31))
        transaction = described_class.new(credit: 100000, balance: 100000)
        expect(transaction.to_s).to eq('31/12/1999 || 1000.00 || || 1000.00')
      end
    end

    context 'when the transaction is negative' do
      it 'returns information in a statement format' do
        allow(Time).to receive(:now).and_return(Time.new(1999, 12, 31))
        transaction = described_class.new(debit: 100000, balance: 100000)
        expect(transaction.to_s).to eq('31/12/1999 || || 1000.00 || 1000.00')
      end
    end
  end
end
