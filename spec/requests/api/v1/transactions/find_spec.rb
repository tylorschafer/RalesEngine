require 'rails_helper'

describe 'transaction find API' do
  it "returns a single transaction by attributes" do
    transaction = create(:transaction)
    create_list(:transaction, 3, result: 'failed')

    get "/api/v1/transactions/find?id=#{transaction.id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(transaction.id)

    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(transaction.id)

    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(transaction.id)

    get "/api/v1/transactions/find?credit_card_expiration_date=#{transaction.credit_card_expiration_date}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(transaction.id)
  end
end
