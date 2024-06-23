require 'rails_helper'

RSpec.describe StockTickerFinder do
  describe '#call' do
    subject(:test_subject) { described_class.new('AABB').call }

    context 'when everything goes well' do
      it 'returns as instance of PolygonStockTicker' do
        stub_request(:get, 'https://api.polygon.io/v2/aggs/ticker/AABB/range/1/day/2023-01-01/2023-12-31?apiKey=abc1234')
          .to_return({
            status: 200,
            body: { success: true }.to_json
          })

        expect(test_subject).to be_an_instance_of(PolygonStockTicker)
      end
    end

    context 'when a communication error happens' do
      it 'returns an error' do
        stub_request(:get, 'https://api.polygon.io/v2/aggs/ticker/AABB/range/1/day/2023-01-01/2023-12-31?apiKey=abc1234').to_timeout

        expect(test_subject.error).to eql 'Unable to communicate with the API: execution expired'
      end
    end
  end
end
