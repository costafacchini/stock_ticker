class StockReport
  attr_reader :report

  def initialize(stock_ticker)
    @report = []
    @report << Statistics.new(label: 'Price', maximum: stock_ticker.maximum_price, minimum: stock_ticker.minimum_price)
    @report << Statistics.new(label: 'Volume', maximum: stock_ticker.maximum_volume, minimum: stock_ticker.minimum_volume)
  end
end