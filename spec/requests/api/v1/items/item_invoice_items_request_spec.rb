require 'rails_helper'

describe 'Item invoice_items API' do
  it 'Returns all associated invoice_items' do
    item = create(:item)
    other_item = create(:item)
    invoice_item_1 = create(:invoice_item, item: item)
    invoice_item_2 = create(:invoice_item, item: item)
    invoice_item_3 = create(:invoice_item, item: item)
    invoice_item_4 = create(:invoice_item, item: other_item)
    item.invoice_items << invoice_item_1
    item.invoice_items << invoice_item_2
    item.invoice_items << invoice_item_3
    other_item.invoice_items << invoice_item_4

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_item_2.id)
    expect(result["data"][2]["attributes"]["id"]).to eq(invoice_item_3.id)
    expect(result["data"][3]).to be_nil
  end
end
