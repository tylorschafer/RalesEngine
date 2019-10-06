require 'rails_helper'

describe 'Items most_revenue API' do
  it 'Returns a variable amount of top items ranked by revenue' do
    item_1 = create(:item)
    invoice_item_1 = create(:invoice_item, item: item_1, quantity: 1, unit_price: 100)
    invoice_1 = create(:invoice)
    invoice_1.invoice_items << invoice_item_1
    create(:transaction, invoice: invoice_1)

    item_2 = create(:item)
    invoice_item_2 = create(:invoice_item, item: item_2, quantity: 1, unit_price: 200)
    invoice_2 = create(:invoice)
    invoice_2.invoice_items << invoice_item_2
    create(:transaction, invoice: invoice_2)

    item_3 = create(:item)
    invoice_item_3 = create(:invoice_item, item: item_3, quantity: 1, unit_price: 300)
    invoice_3 = create(:invoice)
    invoice_3.invoice_items << invoice_item_3
    create(:transaction, invoice: invoice_3)

    item_4 = create(:item)
    invoice_item_4 = create(:invoice_item, item: item_4, quantity: 1, unit_price: 400)
    invoice_4 = create(:invoice)
    invoice_4.invoice_items << invoice_item_4
    create(:transaction, invoice: invoice_4, result: 'failed')

    get "/api/v1/items/most_revenue?quantity=2"

    expect(response).to be_successful
    result = JSON.parse(response.body)

    expect(result["data"][0]["attributes"]["id"]).to eq(item_3.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(item_2.id)
    expect(result["data"][2]).to be_nil
  end
end
