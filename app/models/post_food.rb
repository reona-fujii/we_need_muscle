class PostFood < ApplicationRecord
  belongs_to :user
  has_many :food_coments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_regist_carts, dependent: :destroy
  has_many :food_regist_shows, dependent: :destroy
end
