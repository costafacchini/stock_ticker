require 'rails_helper'

RSpec.describe "V1::StockReportController", type: :request do
  describe 'GET /show' do
    context 'when stock finder returns with success' do
      it 'renders a successful response' do
        stock_ticker_finder = instance_double(StockTickerFinder)
        allow(StockTickerFinder).to receive(:new).with('AABC').and_return(stock_ticker_finder)
        allow(stock_ticker_finder).to receive(:call).and_return(Struct.new(:success, :maximum_price, :minimum_price,
                                                                           :maximum_volume, :minimum_volume)
                                                                      .new(true, 10.0, 3.0, 5.0, 1.2))

        get v1_stock_report_url('AABC')

        expect(stock_ticker_finder).to have_received(:call)

        expect(response).to be_successful
        expect(response.body). to include 'report'
      end
    end

    context 'when stock finder returns with success' do
      it 'renders a error response' do
        stock_ticker_finder = instance_double(StockTickerFinder)
        allow(StockTickerFinder).to receive(:new).with('AABC').and_return(stock_ticker_finder)
        allow(stock_ticker_finder).to receive(:call).and_return(Struct.new(:success, :error).new(false, 'some error'))

        get v1_stock_report_url('AABC')

        expect(stock_ticker_finder).to have_received(:call)

        expect(response).to have_http_status(:not_found)
        expect(response.body). to include 'some error'
      end
    end
  end
end
