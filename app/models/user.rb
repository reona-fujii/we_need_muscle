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
  enum select_setting: {設定しない:0, 自動で設定する:1, 自分で設定する:2}

  def target_calorie
    if sex == "男性"
      target_calorie = 13.397 * weight + 4.799 * height - 5.677 * age + 88.362
      exercise_frequency
    elsif sex == "女性"
      target_calorie = 9.247 * weight + 3.098 * height - 4.33 * age + 447.593
      if exercise == "なにもしていない"
        target_calorie = (target_calorie * 1.2).ceil
      elsif exercise == "週に1〜2回"
        target_calorie = (target_calorie * 1.375).ceil
      elsif exercise == "週に2〜3回"
        target_calorie = (target_calorie * 1.55).ceil
      elsif exercise == "週に3〜5回"
        target_calorie = (target_calorie * 1.725).ceil
      else exercise == "毎日"
        target_calorie = (target_calorie * 1.9).ceil
      end
    else sex == "その他"
      target_calorie = 11.322 * weight + 3.949 * height - 5.00 * age + 267.978
      if exercise == "なにもしていない"
        target_calorie = (target_calorie * 1.2).ceil
      elsif exercise == "週に1〜2回"
        target_calorie = (target_calorie * 1.375).ceil
      elsif exercise == "週に2〜3回"
        target_calorie = (target_calorie * 1.55).ceil
      elsif exercise == "週に3〜5回"
        target_calorie = (target_calorie * 1.725).ceil
      else exercise == "毎日"
        target_calorie = (target_calorie * 1.9).ceil
      end
    end
  end

  def exercise_frequency
    if exercise == "なにもしていない"
      target_calorie = (target_calorie * 1.2).ceil
    elsif exercise == "週に1〜2回"
      target_calorie = (target_calorie * 1.375).ceil
    elsif exercise == "週に2〜3回"
      target_calorie = (target_calorie * 1.55).ceil
    elsif exercise == "週に3〜5回"
      target_calorie = (target_calorie * 1.725).ceil
    elsif exercise == "毎日"
      target_calorie = (target_calorie.to_i * 1.9).ceil
    end
  end

  def target_protain
    (weight * 2).ceil
  end

  def target_fat
    (target_calorie * 0.2 / 9).ceil
  end

  def target_carbon
    ((target_calorie - (target_protain * 4 + target_fat * 9)) / 4).ceil
  end

  def self.search(word)
    self.where(['last_name LIKE ? OR first_name LIKE ? ', "%#{word}%", "%#{word}%"])
  end

end
