require 'rails_helper'

describe 'merchant find_all API' do
  it "Can find a single merchant by any attribute" do
    merchant_1 = create(:merchant, name: 'Tylor')
    merchant_2 = create(:merchant, name: 'Tylor')
    merchant_3 = create(:merchant)

    get "/api/v1/merchants/find_all?id=#{merchant_1.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["name"]).to eq(merchant_1.name)

    get "/api/v1/merchants/find_all?name=#{merchant_2.name}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["name"]).to eq(merchant_1.name)
    expect(result["data"][1]["attributes"]["name"]).to eq(merchant_2.name)
  end
end
