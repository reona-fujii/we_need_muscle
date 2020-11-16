class FoodRegistShowsController < ApplicationController

  # 食事登録編集画面で食事を削除する
  def destroy
    food_regist = FoodRegist.find(params[:food_regist_id])
    food_regist_show = FoodRegistShow.find(params[:id])
    food_regist_shows = FoodRegistShow.where(food_regist_id: food_regist)
    if food_regist_show.destroy && food_regist_shows.count == 0
      food_regist.destroy
      redirect_to my_page_path
    else
      redirect_to edit_food_regist_path(id: food_regist_show.food_regist_id)
    end
  end

end
