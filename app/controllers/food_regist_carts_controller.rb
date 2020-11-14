class FoodRegistCartsController < ApplicationController

  def create
    @food_regist_cart = FoodRegistCart.new(food_regist_cart_params)
    @food_regist_cart.user_id = current_user.id
    @food_regist_cart.save
    redirect_to new_food_regist_path
  end

  def destroy
  end

  def destroy_all
  end

  private
  def food_regist_cart_params
    params.require(:food_regist_cart).permit(:post_food_id)
  end
end
