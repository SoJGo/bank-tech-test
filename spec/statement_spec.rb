# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:empty_transactions) { [] }
  let(:transaction1) { instance_double 'StatementFormat', line: 'transaction1' }
  let(:transaction2) { instance_double 'StatementFormat', line: 'transaction2' }
  let(:transaction3) { instance_double 'StatementFormat', line: 'transaction3' }
  let(:transactions) { [transaction1, transaction2, transaction3] }

  context 'when the transaction array is empty' do
    it 'prints just a header' do
      expect { described_class.new(empty_transactions) }.to output(
        "date || credit || debit || balance\n"
      ).to_stdout
    end
  end

  context 'when the transaction array contains transactions' do
    it 'prints the header with transactions in given order' do
      expect { described_class.new(transactions) }.to output(
        "date || credit || debit || balance\ntransaction1\n" \
        "transaction2\ntransaction3\n"
      ).to_stdout
    end
  end
end
