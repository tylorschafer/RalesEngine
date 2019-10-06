require 'rails_helper'

describe 'Merchant revenue API' do
  it 'Returns the total revenue across merchants for a given date' do
      bob = create(:merchant, name: "bob")
      bob_invoice = create(:invoice, merchant: bob, created_at: Time.now)
      bob_invoice.invoice_items << create(:invoice_item, invoice: bob_invoice, quantity: 1, unit_price: 100)
      create(:transaction, result: 'success', invoice: bob_invoice)

      rob = create(:merchant, name: "rob")
      rob_invoice = create(:invoice, merchant: rob, created_at: Time.now)
      rob_invoice.invoice_items << create(:invoice_item, invoice: rob_invoice, quantity: 1, unit_price: 200)
      create(:transaction, result: 'success', invoice: rob_invoice)

      cob = create(:merchant, name: "cob")
      cob_invoice = create(:invoice, merchant: cob, created_at: Time.now)
      cob_invoice.invoice_items << create(:invoice_item, invoice: cob_invoice, quantity: 1, unit_price: 300)
      create(:transaction, result: 'success', invoice: cob_invoice)

      job = create(:merchant, name: "job")
      job_invoice = create(:invoice, merchant: job, created_at: Time.now - 2.days)
      job_invoice.invoice_items << create(:invoice_item, invoice: job_invoice, quantity: 1, unit_price: 400)
      create(:transaction, result: 'failed', invoice: job_invoice)

      get "/api/v1/merchants/revenue?date=#{Time.now.strftime('%Y-%m-%d')}"

      expect(response).to be_successful
      result = JSON.parse(response.body)
      expect(result["data"]["attributes"]["total_revenue"]).to eq('6.0')
  end
end
