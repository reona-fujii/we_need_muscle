class FoodRegistCart < ApplicationRecord
  belongs_to :user
  belongs_to :post_food

  def self.aggregate(column)
    self.all.map { |food_regist_cart| food_regist_cart.post_food[column] }.sum
  end
end
