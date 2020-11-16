class SearchesController < ApplicationController

  # 検索機能
  def search
    @range = params[:range]
    word = params[:word]
    if @range == '1'
      @user = User.search(params[:word])
      @post_foods = PostFood.where(user_id: @user).page(params[:page]).per(9)
    else
      @post_foods = PostFood.search(params[:word]).page(params[:page]).per(9)
    end
  end

end
