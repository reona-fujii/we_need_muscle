class FoodCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :def_share, only: [:create, :destroy]

  # コメントを投稿する
  def create
    food_comment = current_user.food_comments.new(food_comment_params)
    food_comment.post_food_id = @post_food.id
    food_comment.score = Language.get_data(food_comment_params[:comment])
    @error_food_comment = if food_comment.save
                            nil
                          else
                            food_comment
                          end
  end

  # コメントを削除する
  def destroy
    food_comment = FoodComment.find_by(id: params[:id], post_food_id: params[:post_food_id])
    food_comment.destroy
  end

  # 重複する定義をまとめて定義
  def def_share
    @post_food = PostFood.find(params[:post_food_id])
    @food_comment = FoodComment.new
  end

  private

  def food_comment_params
    params.require(:food_comment).permit(:comment)
  end
end
