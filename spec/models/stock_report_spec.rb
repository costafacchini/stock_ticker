# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StockReport do
  describe '#report' do
    it 'returns an array of items' do
      ticker = Struct.new(:maximum_price, :minimum_price, :maximum_volume, :minimum_volume).new(10.0, 5.0, 4.0, 2.0)
      stock_report = described_class.new(ticker)

      expect(stock_report.report.first).to have_attributes(label: 'Price', maximum: 10.0, minimum: 5.0, average: 7.5,
                                                           format_to_money: true)
      expect(stock_report.report.second).to have_attributes(label: 'Volume', maximum: 4.0, minimum: 2.0, average: 3.0)
    end
  end
end
