require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :unit_price}
  end

  describe 'relationships' do
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
  end

  describe 'Instance Methods' do
    it 'best_day returns the date with the most sales for the item' do
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)

      invoice_1 = create(:invoice, merchant: merchant, created_at: Time.now)
      create(:invoice_item, item: item, invoice: invoice_1)
      create(:transaction, invoice: invoice_1)

      invoice_2 = create(:invoice, merchant: merchant, created_at: Time.now)
      create(:invoice_item, item: item, invoice: invoice_2)
      create(:transaction, invoice: invoice_2)

      invoice_3 = create(:invoice, merchant: merchant, created_at: Time.now - 1.days)
      create(:invoice_item, item: item, invoice: invoice_3)
      create(:transaction, invoice: invoice_3)

      invoice_4 = create(:invoice, merchant: merchant, created_at: Time.now - 2.days)
      create(:invoice_item, item: item, invoice: invoice_4)
      create(:transaction, invoice: invoice_4)

      expect(item.best_day.first).to eq(Date.today)
    end
  end
end
