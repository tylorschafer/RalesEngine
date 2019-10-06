class MerchantMostRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :total_revenue
end
