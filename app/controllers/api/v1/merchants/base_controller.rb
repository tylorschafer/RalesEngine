class Api::V1::Merchants::BaseController < ApplicationController
  private

  def current_merchant
    Merchant.find(params[:id])
  end

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
