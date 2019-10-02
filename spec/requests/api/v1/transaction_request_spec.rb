require 'rails_helper'

describe 'Transactions API' do
  it "Returns all Transactions" do
    create_list(:transaction, 5)

    get '/api/v1/transactions'

    expect(response).to be_successful

    results = JSON.parse(response.body)

    expect(results["data"].count).to eq(5)
  end
end
