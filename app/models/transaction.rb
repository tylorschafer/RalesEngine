class Transaction < ApplicationRecord
  validates_numericality_of :credit_card_number
  validates_presence_of :result

  belongs_to :invoice

  scope :successful, -> { where(result: "success") }

  def self.find_all_by(params)
    Transaction.where(params).order(:id)
  end
end
