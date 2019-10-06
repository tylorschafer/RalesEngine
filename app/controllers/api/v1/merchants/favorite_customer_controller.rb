class Api::V1::Merchants::FavoriteCustomerController < Api::V1::Merchants::BaseController

  def show
    render json: CustomerSerializer.new(current_merchant.favorite_customer)
  end
end
