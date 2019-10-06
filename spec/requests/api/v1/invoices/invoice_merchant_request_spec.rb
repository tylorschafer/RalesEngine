require 'rails_helper'

describe 'Invoice merchant API' do
  it 'Returns the associated merchant' do
    invoice = create(:invoice)
    other_invoice = create(:invoice)
    merchant = invoice.merchant
    other_merchant = other_invoice.merchant

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(merchant.id)
    expect(result["data"]["attributes"]["id"]).to_not eq(other_merchant.id)
  end
end
