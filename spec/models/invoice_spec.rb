require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :status}
  end

  describe 'Relationships' do
    it {should belong_to :customer}
    it {should belong_to :merchant}
  end

  describe 'Class Methods' do
    it "find_all_by" do
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      invoice_1 = create(:invoice, id: 1, customer: customer_1, merchant: merchant_1, status: 0)
      invoice_2 = create(:invoice, id: 2, customer: customer_2, merchant: merchant_1, status: 1)
      invoice_3 = create(:invoice, id: 3, customer: customer_1, merchant: merchant_2, status: 0)

      expect(Invoice.find_all_by(customer_id: customer_1.id)).to eq([invoice_1, invoice_3])
      expect(Invoice.find_all_by(merchant_id: merchant_1.id)).to eq([invoice_1, invoice_2])
      expect(Invoice.find_all_by(status: 1)).to eq([invoice_2])
    end
  end
end
