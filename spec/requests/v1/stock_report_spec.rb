require 'rails_helper'

RSpec.describe "V1::StockReportController", type: :request do
  describe 'GET /show' do
    context 'when stock finder returns with success' do
      it 'renders a successful response' do
        get v1_stock_report_url('AABC')

        expect(response).to be_successful
        expect(response.body). to include 'report'
      end
    end
  end
end
