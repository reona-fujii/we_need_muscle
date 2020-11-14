class FoodRegist < ApplicationRecord
  belongs_to :user
  has_many :food_regist_shows, dependent: :destroy
end
