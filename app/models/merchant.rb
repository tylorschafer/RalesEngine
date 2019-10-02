class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

  def total_revenue
    invoices.joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  # def self.most_revenue(limit_result)
  #   Merchant.joins(:invoice_items)
  #           .select("merchants.name, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
  #           .group('merchants.id')
  #           .order("total_revenue")
  #           .limit(limit_result.to_i)
  # end
end
