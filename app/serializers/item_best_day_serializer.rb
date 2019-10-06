class ItemBestDaySerializer
  def initialize(best_day)
    @best_day = best_day
  end

  def hash
    {
      data: {
        attributes: {
          best_day: @best_day["date"]
        }
      }
    }
  end
end
