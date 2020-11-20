class WeightRegist < ApplicationRecord
  belongs_to :user

  validates :day, presence: true
  validates :weight, presence: true

  def start_time
    self.day
  end

end
