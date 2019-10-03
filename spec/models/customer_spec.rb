require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :first_name}
    it {should validate_presence_of :last_name}
  end

  describe 'Relationships' do
    it {should have_many :invoices}
  end

  describe 'Class Methods' do
    it "find_all_by" do
      tylor_1 = create(:customer, first_name: 'Tylor')
      tylor_2 = create(:customer, first_name: 'Tylor', last_name: 'Schafer')
      schafer_2 = create(:customer, last_name: 'Schafer')

      expect(Customer.find_all_by(first_name: 'Tylor')).to eq([tylor_1, tylor_2])
      expect(Customer.find_all_by(last_name: 'Schafer')).to eq([tylor_2, schafer_2])
    end
  end
end
