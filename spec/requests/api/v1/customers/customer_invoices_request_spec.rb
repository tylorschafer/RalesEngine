require 'rails_helper'

describe 'Customer invoices API' do
  it 'Returns all associated invoices' do
    customer = create(:customer)
    other_customer = create(:customer)
    invoice_1 = create(:invoice, customer: customer)
    invoice_2 = create(:invoice, customer: customer)
    invoice_3 = create(:invoice, customer: customer)
    invoice_4 = create(:invoice, customer: other_customer)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["data"][0]["attributes"]["id"]).to eq(invoice_1.id)
    expect(result["data"][1]["attributes"]["id"]).to eq(invoice_2.id)
    expect(result["data"][2]["attributes"]["id"]).to eq(invoice_3.id)
    expect(result["data"][3]).to be_nil
  end
end
