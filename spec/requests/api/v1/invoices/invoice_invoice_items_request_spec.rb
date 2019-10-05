require 'rails_helper'

describe 'Invoice invoice_items Api' do
  it 'Returns all invoice_items associated with invoice' do
    invoice = create(:invoice)
    other_invoice = create(:invoice)
    invoice_item_1 = create(:invoice_item, invoice: invoice)
    invoice_item_2 = create(:invoice_item, invoice: invoice)
    invoice_item_3 = create(:invoice_item, invoice: invoice)
    invoice_item_4 = create(:invoice_item, invoice: other_invoice)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_item_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_item_2.id)
    expect(result["data"][2]["attributes"]["id"]).to eq(invoice_item_3.id)
    expect(result["data"][3]).to be_nil
  end
end
