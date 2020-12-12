class WeightRegistsController < ApplicationController
  def create
    weight_regist = WeightRegist.new(weight_regist_params)
    weight_regist.day = Time.zone.today
    weight_regist.user_id = current_user.id
    if weight_regist.save
      redirect_to my_page_path
    else
      @weight_regist_error = weight_regist
      # カレンダーの定義
      @callender_food_regists = FoodRegist.where(user_id: current_user)
      # 今日の日付
      @day_params = Time.zone.today
      # 今日の食事内容のレコード定義
      @food_regists = FoodRegist.where(user_id: current_user, day: Time.zone.today)
      # 今日の食事内容の合計値の定義
      food_regist = FoodRegist.where(day: Time.zone.today, user_id: current_user).pluck(:id)
      @food_regist_shows = FoodRegistShow.where(food_regist_id: food_regist)
      # 体重チャート
      @weight_regists = WeightRegist.where(user_id: current_user).pluck(:day, :weight)
      @weight_regist_base = WeightRegist.where(user_id: current_user).average(:weight)
      @weight_regist = WeightRegist.new
      render my_page_path
      # 'users/my_page'
    end
  end

  def weight_regist_params
    params.require(:weight_regist).permit(:weight)
  end
end
