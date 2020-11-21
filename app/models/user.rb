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
  validates :weight, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :height, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :exercise, presence: true
  validates :age, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  end

  with_options on: :step2 do
  validates :calorie, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :protain, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :fat, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :carbon, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  end

  enum exercise: {do_noting: 0 , once_or_twice_a_week: 1 , two_or_three_times_a_week: 2 , three_or_five_times_a_week: 3 , everyday: 4 }
  enum sex: {male: 0, female: 1 , other: 2 }
  enum select_setting: {no_setting: 0 , auto_setting: 1 , manual_setting: 2 }

  def target_calorie
    if sex == "male"
    (male_daily_target_calorie * exercise_frequency).ceil
    elsif sex == "femail"
    (female_daily_target_calorie * exercise_frequency).ceil
    else sex == "other"
    (other_daily_target_calorie * exercise_frequency).ceil
    end
  end

  def male_daily_target_calorie
    13.397 * weight + 4.799 * height - 5.677 * age + 88.362
  end

  def female_daily_target_calorie
    9.247 * weight + 3.098 * height - 4.33 * age + 447.593
  end

  def other_daily_target_calorie
    11.322 * weight + 3.949 * height - 5.00 * age + 267.978
  end

  def exercise_frequency
    if exercise == "do_noting"
      1.2
    elsif exercise == "once_or_twice_a_week"
      1.375
    elsif exercise == "two_or_three_times_a_week"
      1.55
    elsif exercise == "three_or_five_times_a_week"
      1.725
    elsif exercise == "everyday"
      1.9
    end
  end

  def target_protain
    (weight * 2.2).ceil
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
