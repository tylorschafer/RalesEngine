require 'rails_helper'


describe 'Transaction invoice API' do
  it 'Returns the associated invoice' do
    transaction = create(:transaction)
    other_transaction = create(:transaction)
    invoice = transaction.invoice
    other_invoice = other_transaction.invoice

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice.id)
    expect(result["data"]["attributes"]["id"]).to_not eq(other_invoice.id)
  end
end
