require 'rails_helper'

describe 'Merchants API' do
  it "Returns all merchants" do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end

  it "Returns a single merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["id"]).to eq(merchant.id)
  end
end
