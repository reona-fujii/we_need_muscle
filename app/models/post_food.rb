class PostFood < ApplicationRecord
  belongs_to :user
  has_many :food_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_regist_carts, dependent: :destroy
  has_many :food_regist_shows, dependent: :destroy
  attachment :food_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :calorie, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :protain, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :fat, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :carbon, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(word)
    self.where(['name LIKE ?', "%#{word}%"])
  end
end
