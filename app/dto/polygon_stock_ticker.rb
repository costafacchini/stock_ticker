# frozen_string_literal: true

class PolygonStockTicker
  attr_reader :success, :error, :maximum_price, :minimum_price, :maximum_volume, :minimum_volume

  def initialize(response_body)
    parse(response_body)
  end

  private

  def parse(response)
    ticker_json = JSON.parse(response, symbolize_names: true)

    @success = ticker_json[:results].present?

    if @success
      @maximum_price = get_max_value(ticker_json[:results], :h)
      @minimum_price = get_min_value(ticker_json[:results], :l)

      @maximum_volume = get_max_value(ticker_json[:results], :v)
      @minimum_volume = get_min_value(ticker_json[:results], :v)
    else
      @error = ticker_json[:error] || 'Stock ticker not found'
    end
  end

  def get_max_value(results, field)
    day_with_maximum_price = results.max_by { |daily_data| daily_data[field] }
    day_with_maximum_price[field].to_f
  end

  def get_min_value(results, field)
    day_with_minimum_price = results.min_by { |daily_data| daily_data[field] }
    day_with_minimum_price[field].to_f
  end
end
