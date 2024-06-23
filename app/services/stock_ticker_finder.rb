# frozen_string_literal: true

class StockTickerFinder
  def initialize(stock_ticker)
    @http = Http.new
    @stock_ticker = stock_ticker
    @api_key = Rails.application.credentials[ENV.fetch('RAILS_ENV', nil)][:POLYGON_API_KEY]
  end

  def call
    response = @http.get(url)
    PolygonStockTicker.new(response)
  end

  private

  def url
    "https://api.polygon.io/v2/aggs/ticker/#{@stock_ticker}/range/1/day/2023-01-01/2023-12-31?apiKey=#{@api_key}"
  end
end
