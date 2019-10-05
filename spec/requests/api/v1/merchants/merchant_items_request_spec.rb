require 'rails_helper'

describe 'Merchants items API' do
  it 'Returns all items associated with merchant' do
    merchant = create(:merchant)
    other_merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)
    item_3 = create(:item, merchant: merchant)
    item_4 = create(:item, merchant: other_merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(item_2.id)
    expect(result["data"][2]["attributes"]["id"]).to eq(item_3.id)
    expect(result["data"][3]).to be_nil
  end
end
