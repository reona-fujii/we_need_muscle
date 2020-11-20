class FoodCommentsController < ApplicationController
  before_action :authenticate_user!

  # コメントを投稿する
  def create
    @post_food = PostFood.find(params[:post_food_id])
    @food_comment_test = current_user.food_comments.new(food_comment_params)
    @food_comment_test.post_food_id = @post_food.id
    if @food_comment_test.save
      @post_food = PostFood.find(params[:post_food_id])
      @food_comment = FoodComment.new
      @error_food_comment = nil
    else
      @post_food = PostFood.find(params[:post_food_id])
      @food_comment = FoodComment.new
      @error_food_comment = @food_comment_test
    end
  end

  # コメントを削除する
  def destroy
    @post_food = PostFood.find(params[:post_food_id])
    @food_comment = FoodComment.new
    food_comment = FoodComment.find_by(id: params[:id], post_food_id: params[:post_food_id])
    food_comment.destroy
  end

  private
  def food_comment_params
    params.require(:food_comment).permit(:comment, :rate)
  end

end
