class FoodRegistCartsController < ApplicationController
  before_action :authenticate_user!
  
  # 食事登録カートに追加する
  def create
    food_regist_cart = FoodRegistCart.new(food_regist_cart_params)
    food_regist_cart.user_id = current_user.id
    food_regist_cart.save
    redirect_to new_food_regist_path
  end

  # 食事登録カートから一件削除する
  def destroy
    food_regist_cart = FoodRegistCart.find(params[:id])
    food_regist_cart.destroy
    redirect_to new_food_regist_path
  end

  # 食事登録カートから全て削除する
  def destroy_all
    food_regist_carts = FoodRegistCart.all
    food_regist_carts.destroy_all
    redirect_to new_food_regist_path
  end

  private
  def food_regist_cart_params
    params.require(:food_regist_cart).permit(:post_food_id)
  end
end
