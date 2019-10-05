require 'rails_helper'

describe "Invoice item invoice API" do
  it 'Returns the associated invoice' do
    invoice_item = create(:invoice_item)
    other_invoice_item = create(:invoice_item)
    invoice = invoice_item.invoice
    other_invoice = other_invoice_item.invoice

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(invoice.id)
    expect(result["data"]["attributes"]["id"]).to_not eq(other_invoice.id)
  end
end
