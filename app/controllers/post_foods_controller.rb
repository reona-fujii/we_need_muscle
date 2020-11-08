class PostFoodsController < ApplicationController

  def index
    @post_foods = PostFood.page(params[:page]).reverse_order
  end

  def show
  end

  def new
    @post_food = PostFood.new
  end

  def create
    @post_food = PostFood.new(post_food_params)
    @post_food.user_id = current_user.id
    @post_food.save
    redirect_to post_foods_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_food_params
    params.require(:post_food).permit(:name, :introduction, :food_image, :calorie, :protain, :fat, :carbon)
  end
end
