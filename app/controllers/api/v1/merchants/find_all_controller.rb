class Api::V1::Merchants::FindAllController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.find_all_by(find_params))
  end

  private

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
