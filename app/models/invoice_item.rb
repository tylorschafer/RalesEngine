class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates_numericality_of :quantity, :unit_price
end
