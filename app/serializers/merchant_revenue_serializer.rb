class MerchantRevenueSerializer

  def initialize(total_revenue)
    @total_revenue = total_revenue
  end

  def hash
    {
      data: {
        attributes: {
          total_revenue: (@total_revenue.to_f / 100).round(2).to_s
        }
      }
    }
  end
end
