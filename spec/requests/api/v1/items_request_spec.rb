require 'rails_helper'

describe 'Items API' do
  it 'Sends an item index list' do
    create_list(:item, 5)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end
end
