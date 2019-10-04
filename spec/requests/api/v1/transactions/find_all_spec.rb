require 'rails_helper'

describe 'transaction find_all API' do
  it "returns all transactions by attributes" do
    transaction_1 = create(:transaction, result: 'success')
    transaction_2 = create(:transaction, credit_card_number: 1234, result: 'success')
    transaction_3 = create(:transaction, credit_card_number: 1234, result: 'failed')
    transaction_4 = create(:transaction, result: 'failed')


    get "/api/v1/transactions/find_all?id=#{transaction_1.id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["credit_card_number"]).to eq(transaction_1.credit_card_number)

    get "/api/v1/transactions/find_all?invoice_id=#{transaction_2.invoice_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction_2.id)

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction_3.credit_card_number}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction_2.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(transaction_3.id)

    get "/api/v1/transactions/find_all?result=#{transaction_3.result}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(transaction_3.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(transaction_4.id)
    expect(result["data"][3]).to be_nil
  end
end
