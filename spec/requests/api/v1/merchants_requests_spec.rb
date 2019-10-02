require 'rails_helper'

describe 'Merchants API' do
  it "Returns all merchants" do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(5)
  end
  it "Returns the top merchants ranked by revenue" do
    bob = create(:merchant, name: "bob")
    bob_invoice = create(:invoice, merchant: bob)
    bob_invoice.invoice_items << create(:invoice_item, invoice: bob_invoice, quantity: 1, unit_price: 100)
    rob = create(:merchant, name: "rob")
    rob_invoice = create(:invoice, merchant: rob)
    rob_invoice.invoice_items << create(:invoice_item, invoice: rob_invoice, quantity: 1, unit_price: 200)
    cob = create(:merchant, name: "cob")
    cob_invoice = create(:invoice, merchant: cob)
    cob_invoice.invoice_items << create(:invoice_item, invoice: cob_invoice, quantity: 1, unit_price: 300)

    get '/api/v1/merchants/most_revenue?quantity=2'

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.count).to eq(2)
    expect(result[0]["name"]).to eq(cob.name)
    expect(result[1]["name"]).to eq(rob.name)
  end
end
