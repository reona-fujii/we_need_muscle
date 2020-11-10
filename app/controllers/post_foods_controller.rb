class PostFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @post_foods = PostFood.page(params[:page]).reverse_order
  end

  def show
    @post_food = PostFood.find(params[:id])
    @food_comment = FoodComment.new
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
    @post_food = PostFood.find(params[:id])
  end

  def update
    @post_food = PostFood.find(params[:id])
    @post_food.update(post_food_params)
    redirect_to post_food_path(@post_food)
  end

  def destroy
    @post_food = PostFood.find(params[:id])
    @post_food.destroy
    redirect_to post_foods_path
  end

  def ensure_correct_user
    @post_food = PostFood.find(params[:id])
    if current_user.id != @post_food.user_id
      redirect_to post_foods_path
    end
  end

  private
  def post_food_params
    params.require(:post_food).permit(:name, :introduction, :food_image, :calorie, :protain, :fat, :carbon)
  end
end
