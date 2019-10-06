require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'Validations' do
    it {should validate_numericality_of :quantity}
    it {should validate_numericality_of :unit_price}
  end

  describe 'Relationships' do
    it {should belong_to :item}
    it {should belong_to :invoice}
  end

  describe 'Class Methods' do
    it 'find_by returns an Invoice item by given attribute' do
      invoice_item = create(:invoice_item)
      create(:invoice_item)
      create(:invoice_item)

      expect(InvoiceItem.find_by(id: invoice_item.id)).to eq(invoice_item)
    end

    it 'find_all_by returns all Invoice items with given attribute' do
      item = create(:item)
      invoice_item_1 = create(:invoice_item, item: item)
      invoice_item_2 = create(:invoice_item, item: item)
      invoice_item_3 = create(:invoice_item)

      expect(InvoiceItem.find_all_by(item_id: invoice_item_1.item_id)).to eq([invoice_item_1, invoice_item_2])
    end

    it 'find_by_price and find_all_by_price returns invoice_items based on given price' do
      invoice_item_1 = create(:invoice_item, unit_price: 100)
      invoice_item_2 = create(:invoice_item, unit_price: 100)
      create(:invoice_item, unit_price: 1)

      expect(InvoiceItem.find_by_price('1.0')).to eq(invoice_item_1)
      expect(InvoiceItem.find_all_by_price('1.0')).to eq([invoice_item_1, invoice_item_2])
    end
  end
end
