class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant
  has_many :invoice_items

  def self.find_by(params)
    Item.order(:id).find_by(params)
  end

  def self.find_all_by(params)
    Item.where(params).order(:id)
  end

  def self.find_by_price(price_string)
    cents = (price_string.to_f * 100).round
    Item.find_by(unit_price: cents)
  end

  def self.find_all_by_price(price_string)
    cents = (price_string.to_f * 100).round
    Item.where(unit_price: cents)
  end
end
