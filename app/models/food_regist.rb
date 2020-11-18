class FoodRegist < ApplicationRecord
  belongs_to :user
  has_many :food_regist_shows, dependent: :destroy

  validates :day, presence: true
  validates :timing, presence: true

  enum timing: {朝食:0, 昼食:1, 夕食:2, 間食:3}

  def start_time
    self.day
  end

end
