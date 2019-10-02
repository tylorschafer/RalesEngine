class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def total_revenue
    invoices.joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
  end
end
