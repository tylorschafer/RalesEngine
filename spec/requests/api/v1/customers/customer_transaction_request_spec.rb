require 'rails_helper'

describe 'Customer transactions API' do
  it 'Returns all associated transactions' do
    customer = create(:customer)
    other_customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    other_invoice = create(:invoice, customer: other_customer)
    transaction_1 = create(:transaction, invoice: invoice)
    transaction_2 = create(:transaction, invoice: invoice)
    transaction_3 = create(:transaction, invoice: invoice)
    transaction_4 = create(:transaction, invoice: other_invoice)

    get "/api/v1/customers/#{customer.id}/transactions"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(transaction_2.id)
    expect(result["data"][2]["attributes"]["id"]).to eq(transaction_3.id)
    expect(result["data"][3]).to be_nil
  end
end
