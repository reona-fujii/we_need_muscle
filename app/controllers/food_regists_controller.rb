class FoodRegistsController < ApplicationController

  # 食事登録画面
  def new
    @food_regist_carts = FoodRegistCart.where(user_id: current_user.id)
    @food_regist = FoodRegist.new
  end

  def show
  end

  # 食事登録
  def create
    @food_regist = FoodRegist.new(food_regist_params)
    @food_regist.user_id = current_user.id
    if @food_regist.save
      @food_regist_carts = current_user.food_regist_carts
      @food_regist_carts.each do |food_regist_cart|
        food_regist_show = FoodRegistShow.new(food_regist_id: @food_regist.id)
        food_regist_show.post_food_id = food_regist_cart.post_food_id
        food_regist_show.save
      end
      @food_regist_carts.destroy_all
      redirect_to my_page_path
    else
      @food_regist = FoodRegist.new
      render :new
    end
  end

  def edit
  end

  def update
  end

  private
  def food_regist_params
    params.require(:food_regist).permit(:day, :timing)
  end

end
