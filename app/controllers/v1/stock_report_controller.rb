# frozen_string_literal: true

class V1::StockReportController < ApplicationController
  def show
    stock_ticker = StockTickerFinder.new(params[:id]).call
    if stock_ticker.success
      report = StockReport.new(stock_ticker)

      render json: report, status: :ok
    else
      render json: { message: stock_ticker }, status: :not_found
    end
  end
end
