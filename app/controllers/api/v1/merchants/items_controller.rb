class Api::V1::Merchants::ItemsController < Api::V1::Merchants::BaseController

  def index
    render json: ItemSerializer.new(current_merchant.items)
  end
end
