class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true

  has_many :food_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_regist_carts, dependent: :destroy
  has_many :post_foods
  has_many :food_regists, dependent: :destroy
  attachment :profile_image

  with_options on: :step1 do
  validates :sex, presence: true
  validates :weight, presence: true
  validates :height, presence: true
  validates :exercise, presence: true
  validates :age, presence: true
  end

  with_options on: :step2 do
  validates :calorie, presence: true
  validates :protain, presence: true
  validates :fat, presence: true
  validates :carbon, presence: true
  end

  enum exercise: {なにもしていない:0, 週に1〜2回:1, 週に2〜3回:2, 週に3〜5回:3, 毎日:4}
  enum sex: {男性:0, 女性:1, その他:2}

  def self.search(word)
    self.where(['last_name LIKE ? OR first_name LIKE ? ', "%#{word}%", "%#{word}%"])
  end

end
