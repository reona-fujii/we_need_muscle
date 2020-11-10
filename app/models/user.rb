class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true

  has_many :food_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_regist_carts, dependent: :destroy
  has_many :post_foods
  has_many :food_regists, dependent: :destroy
  attachment :profile_image

  def self.search(word)
    self.where(['last_name LIKE ? OR first_name LIKE ? ', "%#{word}%", "%#{word}%"])
  end

end
