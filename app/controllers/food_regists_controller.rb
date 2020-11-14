class FoodRegistsController < ApplicationController

  def new
    @food_regist_carts = FoodRegistCart.where(user_id: current_user.id)
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end
end
