class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice

  validates_numericality_of :quantity, :unit_price

  def self.find_by(params)
    InvoiceItem.order(:id).find_by(params)
  end

  def self.find_all_by(params)
    InvoiceItem.where(params).order(:id)
  end

  def self.find_by_price(price_string)
    cents = (price_string.to_f * 100).round
    InvoiceItem.find_by(unit_price: cents)
  end

  def self.find_all_by_price(price_string)
    cents = (price_string.to_f * 100).round
    InvoiceItem.where(unit_price: cents)
  end
end
