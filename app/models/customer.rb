class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name

  has_many :invoices
  has_many :transactions, through: :invoices

  def self.find_all_by(params)
    Customer.where(params)
  end
end
