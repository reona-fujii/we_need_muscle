class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

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
  
  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to post_foods_path
    end
  end

end
