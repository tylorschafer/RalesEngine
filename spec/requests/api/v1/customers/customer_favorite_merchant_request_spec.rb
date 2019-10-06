require 'rails_helper'

describe 'Customer favorite merchant API' do
  it 'Returns the merchant the customer has the most invoices with' do
    customer = create(:customer)
    merchant = create(:merchant)
    other_merchant = create(:merchant)

    invoice_1 = create(:invoice, customer: customer, merchant: merchant)
    create(:transaction, invoice: invoice_1)

    invoice_2 = create(:invoice, customer: customer, merchant: merchant)
    create(:transaction, invoice: invoice_2)

    invoice_3 = create(:invoice, customer: customer, merchant: other_merchant)
    create(:transaction, invoice: invoice_3)
    create(:transaction, invoice: invoice_3, result: 'Failed')

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_successful
    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["id"]).to eq(merchant.id)
  end
end
