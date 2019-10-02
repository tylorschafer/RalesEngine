class Transaction < ApplicationRecord
  validates_numericality_of :credit_card_number
  validates_presence_of :credit_card_expiration_date, :result
  belongs_to :invoice
end
