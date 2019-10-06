class Api::V1::Items::MerchantController < Api::V1::Items::BaseController

  def show
    render json: MerchantSerializer.new(current_item.merchant)
  end
end
