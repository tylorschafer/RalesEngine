require 'rails_helper'

describe 'invoice find_all API' do
  it "Can find a single invoice by any attribute" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer_1, status: )
    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer_2)
    invoice_3 = create(:invoice, merchant: merchant_2, customer: customer_1)
    invoice_4 = create(:invoice, merchant: merchant_2, customer: customer_2)


    get "/api/v1/invoices/find_all?id=#{invoice_1.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["name"]).to eq(invoice_1.name)

    get "/api/v1/invoices/find_all?name=#{invoice_2.name}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["name"]).to eq(invoice_1.name)
    expect(result["data"][1]["attributes"]["name"]).to eq(invoice_2.name)
  end
end
