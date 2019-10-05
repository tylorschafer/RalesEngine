require 'rails_helper'

describe 'Item merchant API' do
  it 'Returns the associated merchant' do
    item = create(:item)
    other_item = create(:item)
    merchant = item.merchant
    other_merchant = other_item.merchant

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(merchant.id)
    expect(result["data"]["attributes"]["id"]).to_not eq(other_merchant.id)
  end
end
