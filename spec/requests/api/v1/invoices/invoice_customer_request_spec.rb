require 'rails_helper'

describe 'Invoice customer API' do
  it 'Returns the associated invoice customer' do
    invoice = create(:invoice)
    customer = invoice.customer
    other_invoice = create(:invoice)
    other_customer = other_invoice.customer

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"]["attributes"]["id"]).to eq(customer.id)
    expect(result["data"]["attributes"]["id"]).to_not eq(other_customer.id)
  end
end
