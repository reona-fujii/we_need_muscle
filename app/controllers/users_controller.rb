class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:my_page_edit]}

  # マイページ画面
  def my_page
    # カレンダーの定義
    @callender_food_regists = FoodRegist.where(user_id: current_user)
    # 今日の日付
    @day_params = Time.zone.today
    # 今日の食事内容のレコード定義
    @food_regists = FoodRegist.where(user_id: current_user, day: Time.zone.today)
    # 今日の食事内容の合計値レコードの定義
    food_regist = FoodRegist.where(day: Time.zone.today, user_id: current_user).pluck(:id)
    @food_regist_shows = FoodRegistShow.where(food_regist_id: food_regist)
    # 体重登録
    @weight_regist = WeightRegist.new
    @weight_regists = WeightRegist.where(user_id: current_user).pluck(:day, :weight)
    @weight_regist_base = WeightRegist.where(user_id: current_user).average(:weight)
  end

  # 特定の日のマイページ画面
  def my_page_show
    # カレンダーの定義
    @callender_food_regists = FoodRegist.where(user_id: current_user)
    # 押下されたカレンダーの日付
    @day_params = params[:format]
    # 特定の日の食事内容のレコード定義
    @food_regists = FoodRegist.where(user_id: current_user, day: @day_params)
    # 特定の日の食事内容の合計値レコードの定義
    food_regist = FoodRegist.where(day: @day_params, user_id: current_user).pluck(:id)
    @food_regist_shows = FoodRegistShow.where(food_regist_id: food_regist)
    # 体重登録
    @weight_regist = WeightRegist.new
    @weight_regists = WeightRegist.where(user_id: current_user).pluck(:day, :weight)
    @weight_regist_base = WeightRegist.where(user_id: current_user).average(:weight)
  end

  # 特定のユーザーの投稿食事一覧画面
  def show
    @user = User.find(params[:id])
    @post_foods = PostFood.where(user_id: params[:id]).page(params[:page]).reverse_order
    @food_regist_cart = FoodRegistCart.new
  end

  # マイページ編集画面
  def my_page_edit
    @user = current_user
  end

  # マイページ編集を更新する
  def update
    @user = current_user
    @user.select_setting = user_params[:select_setting]
    @user.save
    case @user.select_setting
    when 'no_setting'
      selected_user_params = {last_name: user_params[:last_name], first_name: user_params[:first_name],
                              email: user_params[:email], profile_image: user_params[:profile_image],
                              select_setting: user_params[:select_setting]}
      if @user.update(selected_user_params)
        redirect_to my_page_path
      else
        render :my_page_edit
      end
    when 'auto_setting'
      selected_user_params = {last_name: user_params[:last_name], first_name: user_params[:first_name],
                              email: user_params[:email], profile_image: user_params[:profile_image],
                              sex: user_params[:sex], weight: user_params[:weight], height: user_params[:height],
                              exercise: user_params[:exercise], age: user_params[:age],
                              select_setting: user_params[:select_setting]}
      @user.update(selected_user_params)
      if @user.valid?(:step1)
        redirect_to my_page_path
      else
        render :my_page_edit
        @user.select_setting = 'no_setting'
        @user.save
      end
    else
      @user.select_setting == 'manual_setting'
      selected_user_params = {last_name: user_params[:last_name], first_name: user_params[:first_name],
                              email: user_params[:email], profile_image: user_params[:profile_image],
                              calorie: user_params[:calorie], protain: user_params[:protain], fat: user_params[:fat],
                              carbon: user_params[:carbon], select_setting: user_params[:select_setting]}
      @user.update(selected_user_params)
      if @user.valid?(:step2)
        redirect_to my_page_path
      else
        render :my_page_edit
        @user.select_setting = 'no_setting'
        @user.save
      end
    end
  end

  # ユーザー認証
  def ensure_correct_user
    @user = User.find(params[:format])
    if current_user.id != @user.id
      redirect_to post_foods_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :profile_image, :sex, :weight, :height, :exercise,
                                 :age, :calorie, :protain, :fat, :carbon, :select_setting)
  end
end
