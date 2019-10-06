class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name

  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.find_all_by(params)
    Customer.where(params)
  end

  def favorite_merchant
    merchants
      .select("merchants.*, count(invoices.merchant_id) as invoice_count")
      .joins(:transactions)
      .merge(Transaction.successful)
      .order("invoice_count desc")
      .group("merchants.id")
      .first
  end
end
