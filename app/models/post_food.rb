class PostFood < ApplicationRecord
  belongs_to :user
  has_many :food_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_regist_carts, dependent: :destroy
  has_many :food_regist_shows, dependent: :destroy
  attachment :food_image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :calorie, presence: true
  validates :protain, presence: true
  validates :fat, presence: true
  validates :carbon, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(word)
    self.where(['name LIKE ?', "%#{word}%"])
  end

end
