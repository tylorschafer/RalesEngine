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
end
