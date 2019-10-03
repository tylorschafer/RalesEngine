require 'rails_helper'

describe 'top merchants API' do
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

    expect(result["data"].count).to eq(2)
    expect(result["data"][0]["attributes"]["name"]).to eq(cob.name)
    expect(result["data"][1]["attributes"]["name"]).to eq(rob.name)
  end
end
