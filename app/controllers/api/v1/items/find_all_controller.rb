class Api::V1::Items::FindAllController < Api::V1::Items::BaseController

  def index
    if find_params[:unit_price]
      render json: ItemSerializer.new(Item.find_all_by_price(find_params[:unit_price]))
    else
      render json: ItemSerializer.new(Item.find_all_by(find_params))
    end
  end
end
