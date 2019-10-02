require 'rails_helper'

describe 'Merchants find API' do
  it "returns a merchant by id" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["name"]).to eq(merchant.name)
  end
end
