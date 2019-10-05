require 'rails_helper'

describe 'Items find_all api' do
  it "Finds all items by attribute" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_1, description: item_1.description)
    item_3 = create(:item, merchant: merchant_2, unit_price: item_2.unit_price)
    item_4 = create(:item, merchant: merchant_2, name: item_1.name)

    get "api/v1/items/find_all?id=#{item_1.id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["name"]).to eq(item_1.name)
    expect(result["data"][1]).to be_nil

    get "api/v1/items/find_all?name=#{item_1.name}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(item_4.id)
    expect(result['data'][2]).to be_nil

    get "api/v1/items/find_all?name=#{item_1.description}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(item_2.id)
    expect(result['data'][2]).to be_nil

    get "api/v1/items/find_all?name=#{item_2.unit_price}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(item_2.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(item_3.id)
    expect(result['data'][2]).to be_nil

    get "api/v1/items/find_all?name=#{item_1.merchant_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(item_2.id)
    expect(result['data'][2]).to be_nil

  end
end
