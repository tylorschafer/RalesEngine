require 'rails_helper'

describe 'Invoice find API' do
  it "returns a single invoice by attributes" do
    invoice = create(:invoice)
    invoice_2 = create(:invoice)

    get "/api/v1/invoices/find?id=#{invoice.id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice.id)

    get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice.id)

    get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice.id)

    get "/api/v1/invoices/find?status=#{invoice.status}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice.id)
    expect(result["data"]["attributes"]["id"]).to_not eq(invoice_2.id)
  end
end
