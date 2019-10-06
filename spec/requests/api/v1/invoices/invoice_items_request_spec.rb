require 'rails_helper'

describe 'Invoice items API' do
  it 'Returns all associated items' do
    item_1 = create (:item)
    item_2 = create (:item)
    invoice_item_1 = create(:invoice_item, item: item_1)
    invoice_item_2 = create(:invoice_item, item: item_2)
    invoice = create(:invoice)
    invoice.invoice_items << invoice_item_1
    other_invoice = create(:invoice)
    other_invoice.invoice_items << invoice_item_2

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(item_1.id)
    expect(result["data"][1]).to be_nil
  end
end
