class FoodCommentsController < ApplicationController

  # コメントを投稿する
  def create
    post_food = PostFood.find(params[:post_food_id])
    comment = current_user.food_comments.new(food_comment_params)
    comment.post_food_id = post_food.id
    if comment.save
      redirect_to post_food_path(post_food)
    else
      @post_food = PostFood.find(params[:post_food_id])
      @food_comment = FoodComment.new
      @error_food_comment = comment
      render 'post_foods/show'
    end
  end

  # コメントを削除する
  def destroy
    FoodComment.find_by(id: params[:id], post_food_id: params[:post_food_id]).destroy
    redirect_to post_food_path(params[:post_food_id])
  end

  private
  def food_comment_params
    params.require(:food_comment).permit(:comment, :rate)
  end

end
