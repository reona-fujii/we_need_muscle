class PostFood < ApplicationRecord
  belongs_to :user
  has_many :food_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_regist_carts, dependent: :destroy
  has_many :food_regist_shows, dependent: :destroy
  attachment :food_image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(word)
    self.where(['name LIKE ?', "%#{word}%"])
  end

end
