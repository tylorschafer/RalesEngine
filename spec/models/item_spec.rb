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
    it 'find_by finds an item ordered by its id' do
      item_1 = create(:item)
      create(:item)
      create(:item)

      expect(Item.find_by(id: item_1.id)).to eq(item_1)
    end

    it 'find_all_by returns all items with chosed attribute' do
      item_1 = create(:item, name: 'item')
      item_2 = create(:item, name: 'item')
      item_3 = create(:item)

      expect(Item.find_all_by(name: item_1.name)).to eq([item_1, item_2])
    end

    it 'find_by_price and find_all_by_price finds items based on its price' do
      item_1 = create(:item, unit_price: 1234)
      item_2 = create(:item, unit_price: 1234)
      item_3 = create(:item)

      expect(Item.find_by_price('12.34')).to eq(item_1)
      expect(Item.find_all_by_price('12.34')).to eq([item_1, item_2])
    end

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

      expect(item.best_day.date).to eq(Date.today)
    end
  end

  describe 'Class Methods' do
    it "most_revenue returns the top items by revenue" do
      item_1 = create(:item)
      invoice_item_1 = create(:invoice_item, item: item_1, quantity: 1, unit_price: 100)
      invoice_1 = create(:invoice)
      invoice_1.invoice_items << invoice_item_1
      create(:transaction, invoice: invoice_1)

      item_2 = create(:item)
      invoice_item_2 = create(:invoice_item, item: item_2, quantity: 1, unit_price: 200)
      invoice_2 = create(:invoice)
      invoice_2.invoice_items << invoice_item_2
      create(:transaction, invoice: invoice_2)

      item_3 = create(:item)
      invoice_item_3 = create(:invoice_item, item: item_3, quantity: 1, unit_price: 300)
      invoice_3 = create(:invoice)
      invoice_3.invoice_items << invoice_item_3
      create(:transaction, invoice: invoice_3)

      item_4 = create(:item)
      invoice_item_4 = create(:invoice_item, item: item_4, quantity: 1, unit_price: 400)
      invoice_4 = create(:invoice)
      invoice_4.invoice_items << invoice_item_4
      create(:transaction, invoice: invoice_4, result: 'failed')

      expect(Item.most_revenue(2)).to eq([item_3, item_2])
    end
  end
end
