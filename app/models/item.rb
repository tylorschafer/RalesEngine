class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant
  has_many :invoice_items

  def self.find_all_by(params)
    Item.where(params).order(:id)
  end
end
