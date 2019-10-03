class Invoice < ApplicationRecord
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  enum status: { shipped: 0, unfulfilled: 1}

  def self.find_all_by(params)
    Invoice.where(params)
  end
end
