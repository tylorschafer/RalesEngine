require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
  end

  describe 'Relationships' do
    it {should have_many :invoices}
  end

  describe 'Class Methods' do
    it "find_all_by" do
      tylor_1 = create(:customer, first_name: 'Tylor')
      tylor_2 = create(:customer, first_name: 'Tylor', last_name: 'Schafer')
      schafer_2 = create(:customer, last_name: 'Schafer')

      expect(Customer.find_all_by(first_name: 'Tylor')).to eq([tylor_1, tylor_2])
      expect(Customer.find_all_by(last_name: 'Schafer')).to eq([tylor_2, schafer_2])
    end
  end

  describe 'Instance Methods' do
    it "#Favorite merchant will return the merchant the customer has most successful transactions with" do
      customer = create(:customer)
      merchant = create(:merchant)
      other_merchant = create(:merchant)

      invoice_1 = create(:invoice, customer: customer, merchant: merchant)
      create(:transaction, invoice: invoice_1)

      invoice_2 = create(:invoice, customer: customer, merchant: merchant)
      create(:transaction, invoice: invoice_2)

      invoice_3 = create(:invoice, customer: customer, merchant: other_merchant)
      create(:transaction, invoice: invoice_3)
      create(:transaction, invoice: invoice_3, result: 'Failed')

      expect(customer.favorite_merchant).to eq(merchant)
    end
  end
end
