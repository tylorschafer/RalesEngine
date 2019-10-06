class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    render json: MerchantRevenueSerializer.new(Merchant.revenue(params[:date])).hash
  end
end
