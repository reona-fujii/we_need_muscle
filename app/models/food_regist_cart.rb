class FoodRegistCart < ApplicationRecord
  belongs_to :user
  belongs_to :post_food
end
