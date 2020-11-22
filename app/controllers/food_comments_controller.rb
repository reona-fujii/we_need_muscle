class FoodCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :def_share, only: [:create, :destroy]

  # コメントを投稿する
  def create
    @food_comment_test = current_user.food_comments.new(food_comment_params)
    @food_comment_test.post_food_id = @post_food.id
    @error_food_comment = if @food_comment_test.save
                            nil
                          else
                            @food_comment_test
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
    params.require(:food_comment).permit(:comment, :rate)
  end
end
