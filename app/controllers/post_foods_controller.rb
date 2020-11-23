class PostFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  # 投稿食事一覧画面
  def index
    @post_foods = PostFood.page(params[:page]).reverse_order
    @food_regist_cart = FoodRegistCart.new
  end

  # 投稿食事詳細画面
  def show
    @post_food = PostFood.find(params[:id])
    @food_comment = FoodComment.new
    @food_regist_cart = FoodRegistCart.new
  end

  # 新規投稿食事画面
  def new
    @post_food = PostFood.new
  end

  # 新規投稿する
  def create
    @post_food = PostFood.new(post_food_params)
    @post_food.user_id = current_user.id
    if @post_food.save
      redirect_to post_foods_path
    else
      render :new
    end
  end

  # 投稿食事編集画面
  def edit
    @post_food = PostFood.find(params[:id])
  end

  # 投稿食事の編集を更新する
  def update
    @post_food = PostFood.find(params[:id])
    if @post_food.update(post_food_params)
      redirect_to post_food_path(@post_food)
    else
      render :edit
    end
  end

  # 投稿を削除する
  def destroy
    @post_food = PostFood.find(params[:id])
    @post_food.destroy
    redirect_to post_foods_path
  end

  # ユーザー認証
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
