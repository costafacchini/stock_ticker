class V1::StockReportController < ApplicationController
  def show
    stock_ticker = Struct.new(:maximum_price, :minimum_price, :maximum_volume, :minimum_volume)
                         .new(100.0, 50.0, 10.0, 6.0)
    report = StockReport.new(stock_ticker)

    render json: report, status: :ok
  end
end
