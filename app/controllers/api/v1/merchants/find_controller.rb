class Api::V1::Merchants::FindController < Api::V1::Merchants::BaseController

  def show
    render json: MerchantSerializer.new(Merchant.find_by(find_params))
  end
end
