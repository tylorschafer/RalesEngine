require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Relationships' do
    it {should have_many :items}
    it {should have_many(:invoices)}
  end

  describe 'Instance Methods' do
    it "#total revenue" do
      invoice = create(:invoice)
      create(:invoice_item, invoice: invoice, quantity: 1, unit_price: 100)
      create(:invoice_item, invoice: invoice, quantity: 2, unit_price: 100)
      create(:invoice_item, invoice: invoice, quantity: 3, unit_price: 100)

      expect(invoice.merchant.total_revenue).to eq(600)
    end
  end
end
