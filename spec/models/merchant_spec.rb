require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Relationships' do
    it {should have_many :items}
    it {should have_many(:invoices)}
  end

  describe 'Class methods' do
    it "find_all_by" do
      tylor_1 = create(:merchant, name: 'Tylor')
      tylor_2 = create(:merchant, name: 'Tylor')
      create(:merchant)

      results = Merchant.find_all_by(name: 'Tylor')

      expect(results[0].id).to eq(tylor_1.id)
      expect(results[1].id).to eq(tylor_2.id)
    end

    it "most_revenue returns the top merchants by revenue" do
      bob = create(:merchant, name: "bob")
      bob_invoice = create(:invoice, merchant: bob)
      bob_invoice.invoice_items << create(:invoice_item, invoice: bob_invoice, quantity: 1, unit_price: 100)
      create(:transaction, result: 'success', invoice: bob_invoice)

      rob = create(:merchant, name: "rob")
      rob_invoice = create(:invoice, merchant: rob)
      rob_invoice.invoice_items << create(:invoice_item, invoice: rob_invoice, quantity: 1, unit_price: 200)
      create(:transaction, result: 'success', invoice: rob_invoice)

      cob = create(:merchant, name: "cob")
      cob_invoice = create(:invoice, merchant: cob)
      cob_invoice.invoice_items << create(:invoice_item, invoice: cob_invoice, quantity: 1, unit_price: 300)
      create(:transaction, result: 'success', invoice: cob_invoice)

      job = create(:merchant, name: "job")
      job_invoice = create(:invoice, merchant: job)
      job_invoice.invoice_items << create(:invoice_item, invoice: job_invoice, quantity: 1, unit_price: 400)
      create(:transaction, result: 'failed', invoice: job_invoice)

      expect(Merchant.most_revenue(2)).to eq([cob, rob])
    end

    it "revenue returns total revenue for all merchants on a specific date" do
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

      expect(Merchant.revenue(Time.now.strftime('%Y-%m-%d').to_s)).to eq(600)
    end
  end
end
