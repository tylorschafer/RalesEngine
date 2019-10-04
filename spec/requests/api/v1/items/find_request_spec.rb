require 'rails_helper'

describe 'Items find api' do
  it "Finds a single item by attributes" do
    item = create(:item)
    create(:item)

    get "/api/v1/items/find?id=#{item.id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["name"]).to eq(item.name)

    get "/api/v1/items/find?name=#{item.name}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(item.id)

    get "/api/v1/items/find?description=#{item.description}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(item.id)

    get "/api/v1/items/find?unit_price=#{item.unit_price}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(item.id)

    get "/api/v1/items/find?merchant_id=#{item.merchant_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(item.id)

  end
end
