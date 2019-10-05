require 'rails_helper'

describe 'Invoice item find_all api' do
  it 'Finds all invoice_items by attributes' do
    item_1 = create(:item)
    item_2 = create(:item)
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    invoice_item_1 = create(:invoice_item, item: item_1, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, item: item_2, invoice: invoice_1, quantity: invoice_item_1.quantity)
    invoice_item_3 = create(:invoice_item, item: item_1, invoice: invoice_2, unit_price: invoice_item_1.unit_price)
    invoice_item_4 = create(:invoice_item, item: item_2, invoice: invoice_2, quantity: invoice_item_1.quantity)

    get "/api/v1/invoice_items/find_all?item_id=#{invoice_item_1.item_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_item_3.id)
    expect(result["data"][2]).to be_nil

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_item_1.invoice_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_item_2.id)
    expect(result["data"][2]).to be_nil

    get "/api/v1/invoice_items/find_all?quantity=#{invoice_item_1.quantity}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_item_2.id)
    expect(result["data"][2]["attributes"]["id"]).to eq(invoice_item_4.id)
    expect(result["data"][3]).to be_nil

    price_string = (invoice_item_1.unit_price.to_f / 100).to_s
    get "/api/v1/invoice_items/find_all?unit_price=#{price_string}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_item_3.id)
    expect(result["data"][2]).to be_nil
  end
end
