require 'rails_helper'

describe 'Merchant invoices Api' do
  it 'Returns a collection of associated invoices' do
    merchant = create(:merchant)
    other_merchant = create(:merchant)
    invoice_1 = create(:invoice, merchant: merchant)
    invoice_2 = create(:invoice, merchant: merchant)
    invoice_3 = create(:invoice, merchant: merchant)
    invoice_4 = create(:invoice, merchant: other_merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_2.id)
    expect(result["data"][2]["attributes"]["id"]).to eq(invoice_3.id)
    expect(result["data"][3]).to be_nil
  end
end
