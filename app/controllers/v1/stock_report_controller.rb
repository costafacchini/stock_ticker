class V1::StockReportController < ApplicationController
  def show
    stock_ticker = Struct.new(:maximum_price, :minimum_price, :average_price, :maximum_volume, :minimum_volume, :average_volume)
                         .new(100.0, 50.0, 75.0, 10.0, 6.0, 8.0)
    report = StockReport.new(stock_ticker)

    render json: { report: report }, status: :ok
  end
end
