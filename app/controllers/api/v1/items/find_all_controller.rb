class Api::V1::Items::FindAllController < Api::V1::Items::BaseController

  def index
    render json: ItemSerializer.new(Item.find_all_by(find_params))
  end
end
