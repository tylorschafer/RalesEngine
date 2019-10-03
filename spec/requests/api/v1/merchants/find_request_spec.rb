require 'rails_helper'

describe 'Merchants find API' do
  it "returns a single merchant by attributes" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["name"]).to eq(merchant.name)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["id"]).to eq(merchant.id)
  end
end
