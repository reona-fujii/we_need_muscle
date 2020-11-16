class FavoritesController < ApplicationController

  # お気に入り一覧画面
  def index
    my_favorite_food_ids = Favorite.where(user_id: current_user.id).pluck(:post_food_id)
    @post_foods = PostFood.where(id: my_favorite_food_ids).page(params[:page]).per(9)
  end

  # お気に入りに追加する
  def create
    post_food = PostFood.find(params[:post_food_id])
    favorite = current_user.favorites.new(post_food_id: post_food.id)
    favorite.save
    redirect_to post_food_path(post_food)
  end

  # お気に入りから削除する
  def destroy
    post_food = PostFood.find(params[:post_food_id])
    favorite = current_user.favorites.find_by(post_food_id: post_food.id)
    favorite.destroy
    redirect_to post_food_path(post_food)
  end
end
