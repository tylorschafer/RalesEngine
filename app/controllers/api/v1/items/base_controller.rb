class Api::V1::Items::BaseController < ApplicationController

  private

  def current_item
    Item.find(params[:id])
  end

  def find_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :updated_at, :created_at)
  end
end
