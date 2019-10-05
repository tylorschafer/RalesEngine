require 'rails_helper'

describe 'Invoice items find API' do

  it 'Finds the first instance of an invoice_item by attribute' do
    invoice_item = create (:invoice_item)
    create(:invoice_item)

    get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["invoice_id"]).to eq(invoice_item.invoice_id)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice_item.id)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice_item.id)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice_item.id)

    price_string = (invoice_item.unit_price.to_f / 100).to_s
    get "/api/v1/invoice_items/find?unit_price=#{price_string}"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice_item.id)
  end
end
