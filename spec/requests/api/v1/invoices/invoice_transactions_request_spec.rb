require 'rails_helper'

describe 'Invoice transactions API' do
  it 'Returns all associated transactions' do
    invoice = create(:invoice)
    other_invoice = create(:invoice)
    transaction_1 = create(:transaction, invoice: invoice)
    transaction_2 = create(:transaction, invoice: invoice, result: 'failed')
    transaction_3 = create(:transaction, invoice: other_invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(transaction_2.id)
    expect(result["data"][2]).to be_nil
  end
end
