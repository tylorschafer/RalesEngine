require 'rails_helper'

describe 'invoice find_all API' do
  it "Can find a single invoice by any attribute" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer_1, status: 0)
    invoice_2 = create(:invoice, merchant: merchant_1, customer: customer_2, status: 0)
    invoice_3 = create(:invoice, merchant: merchant_2, customer: customer_1, status: 1)
    invoice_4 = create(:invoice, merchant: merchant_2, customer: customer_2, status: 1)


    get "/api/v1/invoices/find_all?id=#{invoice_1.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["customer_id"]).to eq(invoice_1.customer_id)

    get "/api/v1/invoices/find_all?customer_id=#{invoice_2.customer_id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_2.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_4.id)
    expect(result["data"][2]).to be_nil

    get "/api/v1/invoices/find_all?merchant_id=#{invoice_2.merchant_id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_2.id)
    expect(result["data"][2]).to be_nil

    get "/api/v1/invoices/find_all?status=shipped"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_2.id)
    expect(result["data"][2]).to be_nil
  end
end
