class FoodRegistsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:show, :edit, :update]}
  # 食事登録画面
  def new
    @food_regist_carts = FoodRegistCart.where(user_id: current_user.id)
    @food_regist = FoodRegist.new
  end

  # 食事登録詳細画面
  def show
    @food_regist = FoodRegist.find(params[:id])
    @food_regist_shows = FoodRegistShow.where(food_regist_id: @food_regist.id)
  end

  # 食事登録を確定する
  def create
    food_regist = FoodRegist.new(food_regist_params)
    food_regist.user_id = current_user.id
    if food_regist.save
      @food_regist_carts = current_user.food_regist_carts
      @food_regist_carts.each do |food_regist_cart|
        food_regist_show = FoodRegistShow.new(food_regist_id: food_regist.id)
        food_regist_show.post_food_id = food_regist_cart.post_food_id
        food_regist_show.save
      end
      @food_regist_carts.destroy_all
      redirect_to my_page_path
    else
      @food_regist_carts = FoodRegistCart.where(user_id: current_user.id)
      @food_regist = FoodRegist.new
      @error_food_regist = food_regist
      render :new
    end
  end

  # 食事登録編集画面
  def edit
    @food_regist = FoodRegist.find(params[:id])
    @food_regist_shows = FoodRegistShow.where(food_regist_id: @food_regist.id)
  end

  # 食事登録編集を更新する
  def update
    food_regist = FoodRegist.find(params[:id])
    if food_regist.update(food_regist_params)
      redirect_to my_page_path
    else
      @food_regist = FoodRegist.find(params[:id])
      @food_regist_shows = FoodRegistShow.where(food_regist_id: @food_regist.id)
      render :edit
    end
  end

  # ユーザー認証
  def ensure_correct_user
    food_regist = FoodRegist.find(params[:id])
    if current_user.id != food_regist.user_id
      redirect_to my_page_path
    end
  end

  private

  def food_regist_params
    params.require(:food_regist).permit(:day, :timing)
  end
end
