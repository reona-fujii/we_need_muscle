class UsersController < ApplicationController

  def my_page
  end

  def show
    @user = User.find(params[:id])
    @post_foods = PostFood.where(user_id: params[:id]).page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
