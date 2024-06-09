require 'rails_helper'

RSpec.describe PolygonStockTicker do
  context "when response is unsuccessfull" do
    describe "#error" do
      it "fills error returned by API" do
        response = { error: 'some error' }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to eql false
        expect(polygon_ticker.error).to eql 'some error'
      end

      context "when stock ticker not found" do
        it "fills error with stock ticker not found" do
        response = { results: [] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to eql false
        expect(polygon_ticker.error).to eql 'Stock ticker not found'
      end
      end
    end
  end

  context "when response is successfull" do
    describe "#maximum_price" do
      it "returns the maximum price" do
        response = { results: [{ h: 10, l: 8 }, { h:5, l: 3 }, { h:5, l: 4 }, { h: 14, l: 5 }] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to eql true
        expect(polygon_ticker.maximum_price).to eql 14.0
      end
    end

    describe "#minimum_price" do
      it "returns the minimum price" do
        response = { results: [{ h: 10, l: 8 }, { h:5, l: 3 }, { h:5, l: 4 }, { h: 14, l: 5 }] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to eql true
        expect(polygon_ticker.minimum_price).to eql 3.0
      end
    end

    describe "#maximum_volume" do
      it "returns the maximum volume" do
        response = { results: [{ v: 7 }, { v: 2 }, { v:5 }, { v: 10 }] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to eql true
        expect(polygon_ticker.maximum_volume).to eql 10.0
      end
    end

    describe "#minimum_volume" do
      it "returns the minimum volume" do
        response = { results: [{ v: 7 }, { v: 2 }, { v:5 }, { v: 10 }] }.to_json

        polygon_ticker = described_class.new(response)

        expect(polygon_ticker.success).to eql true
        expect(polygon_ticker.minimum_volume).to eql 2.0
      end
    end
  end
end