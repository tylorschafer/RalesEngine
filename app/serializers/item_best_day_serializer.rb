class ItemBestDaySerializer
  def initialize(best_day_array)
    @best_day_array = best_day_array
  end

  def hash
    {
      data: {
        attributes: {
          best_day: @best_day_array[0].strftime('%Y-%m-%d')
        }
      }
    }
  end
end
