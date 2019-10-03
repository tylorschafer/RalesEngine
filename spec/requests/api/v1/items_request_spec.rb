require 'rails_helper'

describe 'Items API' do
  it 'Returns all items' do
    create_list(:item, 5)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end

  it "Returns a single item" do
    item = create(:item)

    get "/api/v1/items/#{item.id}"

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result["data"]["attributes"]["id"]).to eq(item.id)
  end
end
