class FoodRegistShow < ApplicationRecord
  belongs_to :food_regist
  belongs_to :post_food

  def self.aggregate(column)
    self.all.map { |food_regist_show| food_regist_show.post_food[column] }.sum
  end

  def start_time
    food_regist.day
  end

end
