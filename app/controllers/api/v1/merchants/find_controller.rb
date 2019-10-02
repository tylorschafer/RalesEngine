class Api::V1::Merchants::FindController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

end
