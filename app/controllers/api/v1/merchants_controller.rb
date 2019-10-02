class Api::V1::MerchantsController < ApplicationController

  def most_revenue
    render json: Merchant.most_revenue(params[:quantity])
  end

end
