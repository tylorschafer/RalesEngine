require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'Valadations' do
    it {should validate_numericality_of :credit_card_number}
    it {should validate_presence_of  :result}
  end

  describe 'Relationships' do
    it {should belong_to :invoice}
  end

  describe 'Class Methods' do
    it 'find_all_by will find all transactions by given attribute' do
      transaction_1 = create(:transaction, result: 'failed')
      transaction_2 = create(:transaction, result: 'failed')
      transaction_3 = create(:transaction)

      expect(Transaction.find_all_by(result: 'failed')).to eq([transaction_1, transaction_2])
    end
  end
end
