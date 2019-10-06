class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.find_all_by(params)
    Merchant.where(params)
  end

  def self.most_revenue(limit_result)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
      .joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.successful)
      .group('merchants.id')
      .order('total_revenue desc')
      .limit(limit_result.to_i)
  end

  def self.revenue(date)
    self.joins(invoices: [:invoice_items, :transactions])
      .merge(Transaction.successful)
      .where('CAST(invoices.created_at AS text) LIKE ?', "%#{date}%")
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end
end
