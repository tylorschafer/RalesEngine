class Api::V1::Merchants::FindAllController < Api::V1::Merchants::BaseController

  def index
    render json: MerchantSerializer.new(Merchant.find_all_by(find_params))
  end
end
