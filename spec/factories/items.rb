FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::ChuckNorris.fact }
    unit_price { rand(10000..99999) }
    merchant
  end
end
