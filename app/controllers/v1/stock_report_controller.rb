class V1::StockReportController < ApplicationController
  def show
    report = [
      {
        label: 'Price',
        maximum: 100.0,
        minimum: 50.0,
        average: 75.0
      },
      {
        label: 'Volume',
        maximum: 10.0,
        minimum: 6.0,
        average: 8.0
      }
    ]

    render json: { report: report }, status: :ok
  end
end
