class Api::V1::Items::FindController < Api::V1::Items::BaseController

  def show
    render json: ItemSerializer.new(Item.find_by(find_params))
  end
end
