class StockTickerFinder
  def initialize(stock_ticker)
    @http = Http.new
    @stock_ticker = stock_ticker
  end

  def call
    response = @http.get(url)
    stock_ticker = PolygonStockTicker.new(response)
    stock_ticker
  end

  private

  def url
    "https://api.polygon.io/v2/aggs/ticker/#{@stock_ticker}/range/1/day/2023-01-01/2023-12-31?apiKey=taIMgMrmnZ8SUZmdpq9_7ANRDxw3IPIx"
  end
end
