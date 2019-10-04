require 'rails_helper'

describe 'transaction find_all API' do
  it "returns all transactions by attributes" do
    transaction_1 = create(:transaction, result: 'success')
    transaction_2 = create(:transaction, result: 'success')
    transaction_3 = create(:transaction, result: 'failed')
    transaction_4 = create(:transaction, result: 'failed')


    get "/api/v1/transactions/find?id=#{transaction.id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction.id)

    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction.id)

    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction.id)

    get "/api/v1/transactions/find?result=#{transaction.result}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction.id)
  end
end
