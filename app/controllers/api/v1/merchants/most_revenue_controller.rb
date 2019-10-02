class Api::V1::Merchants::MostRevenueController < Api::V1::MerchantsController

  def index
    render json: Merchant.most_revenue(params[:quantity])
  end
end
