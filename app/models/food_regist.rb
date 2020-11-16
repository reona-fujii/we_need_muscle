class FoodRegist < ApplicationRecord
  belongs_to :user
  has_many :food_regist_shows, dependent: :destroy

  validates :day, presence: true
  validates :timing, presence: true

  enum timing: {朝食:0, 昼食:1, 夕食:2, 間食:3}

  def self.aggregate(column)
    self.all.map { |food_regists| food_regist.post_food[column] }.sum
  end

  def start_time
    self.day
  end

end
