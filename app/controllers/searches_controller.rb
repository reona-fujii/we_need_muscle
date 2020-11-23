class SearchesController < ApplicationController
  before_action :authenticate_user!

  # 検索機能
  def search
    @food_regist_cart = FoodRegistCart.new
    range = params[:range]
    if range == '1'
      @user = User.search(params[:word])
      @post_foods = PostFood.where(user_id: @user).page(params[:page]).per(9)
    else
      @post_foods = PostFood.search(params[:word]).page(params[:page]).per(9)
    end
  end
end
