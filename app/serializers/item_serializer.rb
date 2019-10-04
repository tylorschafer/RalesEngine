class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :merchant_id, :name, :description

  attribute :unit_price do |object|
    (object.unit_price.to_f / 100).to_s
  end
end
