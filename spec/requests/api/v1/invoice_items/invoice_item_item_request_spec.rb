require 'rails_helper'

describe 'Invoice item item API' do
  it 'Returns the associated item' do
    invoice_item = create(:invoice_item)
    other_invoice_item = create(:invoice_item)
    item = invoice_item.item
    other_item = other_invoice_item.item

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(item.id)
    expect(result["data"]["attributes"]["id"]).to_not eq(other_item.id)
  end
end
