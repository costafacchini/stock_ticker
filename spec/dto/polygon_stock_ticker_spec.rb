# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PolygonStockTicker do
  context 'when response is unsuccessfull' do
    describe '#error' do
      it 'fills error returned by API' do
        response = { error: 'some error' }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to be false
        expect(polygon_ticker.error).to eql 'some error'
      end

      it 'fills error if stock ticker not found' do
        response = { results: [] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to be false
        expect(polygon_ticker.error).to eql 'Stock ticker not found'
      end
    end
  end

  context 'when response is successfull' do
    describe '#maximum_price' do
      it 'returns the maximum price' do
        response = { results: [{ h: 10, l: 8 }, { h: 5, l: 3 }, { h: 5, l: 4 }, { h: 14, l: 5 }] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to be true
        expect(polygon_ticker.maximum_price).to be 14.0
      end
    end

    describe '#minimum_price' do
      it 'returns the minimum price' do
        response = { results: [{ h: 10, l: 8 }, { h: 5, l: 3 }, { h: 5, l: 4 }, { h: 14, l: 5 }] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to be true
        expect(polygon_ticker.minimum_price).to be 3.0
      end
    end

    describe '#maximum_volume' do
      it 'returns the maximum volume' do
        response = { results: [{ v: 7 }, { v: 2 }, { v: 5 }, { v: 10 }] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to be true
        expect(polygon_ticker.maximum_volume).to be 10.0
      end
    end

    describe '#minimum_volume' do
      it 'returns the minimum volume' do
        response = { results: [{ v: 7 }, { v: 2 }, { v: 5 }, { v: 10 }] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to be true
        expect(polygon_ticker.minimum_volume).to be 2.0
      end
    end
  end
end
