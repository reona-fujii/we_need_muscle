class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id)
    @post_foods = PostFood.where(id: @favorites).page(params[:page]).per(9)
  end

  def create
    post_food = PostFood.find(params[:post_food_id])
    favorite = current_user.favorites.new(post_food_id: post_food.id)
    favorite.save
    redirect_to post_food_path(post_food)
  end

  def destroy
    post_food = PostFood.find(params[:post_food_id])
    favorite = current_user.favorites.find_by(post_food_id: post_food.id)
    favorite.destroy
    redirect_to post_food_path(post_food)
  end
end
