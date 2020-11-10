class FoodCommentsController < ApplicationController

  def create
    post_food = PostFood.find(params[:post_food_id])
    comment = current_user.food_comments.new(food_comment_params)
    comment.post_food_id = post_food.id
    comment.save
    redirect_to post_food_path(post_food)
  end

  def destroy
    FoodComment.find_by(id: params[:id], post_food_id: params[:post_food_id]).destroy
    redirect_to post_food_path(params[:post_food_id])
  end

  private
  def food_comment_params
    params.require(:food_comment).permit(:comment, :rate)
  end

end
