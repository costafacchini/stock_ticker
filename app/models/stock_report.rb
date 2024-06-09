class StockReport
  attr_reader :report

  def initialize(stock_ticker)
    @report = []
    @report << Struct.new(:label, :maximum, :minimum, :average).new('Price', stock_ticker.maximum_price,  stock_ticker.minimum_price, stock_ticker.average_price)
    @report << Struct.new(:label, :maximum, :minimum, :average).new('Volume', stock_ticker.maximum_volume, stock_ticker.minimum_volume, stock_ticker.average_volume)
  end
end