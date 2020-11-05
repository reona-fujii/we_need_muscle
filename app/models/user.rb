class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :food_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :food_regist_carts, dependent: :destroy
  has_many :post_foods
  has_many :food_regists, dependent: :destroy
end
