class Api::V1::Items::BestDayController < Api::V1::Items::BaseController

  def show
    render json: ItemBestDaySerializer.new(current_item.best_day).hash
  end
end
