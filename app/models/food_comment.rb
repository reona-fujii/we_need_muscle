class FoodComment < ApplicationRecord
  belongs_to :user
  belongs_to :post_food

  validates :comment, presence: true
end
