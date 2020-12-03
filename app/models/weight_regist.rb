class WeightRegist < ApplicationRecord
  belongs_to :user

  validates :day, presence: true
  validates :weight, presence: true
end
