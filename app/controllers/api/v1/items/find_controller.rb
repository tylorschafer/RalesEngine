class Api::V1::Items::FindController < Api::V1::Items::BaseController

  def show
    if find_params[:unit_price]
      render json: ItemSerializer.new(Item.find_by_price(find_params[:unit_price]))
    else
      render json: ItemSerializer.new(Item.find_by(find_params))
    end
  end
end
