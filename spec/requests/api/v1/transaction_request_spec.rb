require 'rails_helper'

describe 'Transactions API' do
  it "Returns all Transactions" do
    create_list(:transaction, 5)

    get '/api/v1/transactions'

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"].count).to eq(5)
  end

  it "Returns a single transaction" do
    transaction = create(:transaction)

    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["id"]).to eq(transaction.id)
  end
end
