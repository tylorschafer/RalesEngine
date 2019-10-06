class Api::V1::Customers::FavoriteMerchantController < Api::V1::Customers::BaseController

  def show
    render json: MerchantSerializer.new(current_customer.favorite_merchant)
  end
end
