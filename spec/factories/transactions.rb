FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number { 1 }
    credit_card_expiration_date { "2019-09-30 20:35:32" }
    result { "MyString" }
  end
end
