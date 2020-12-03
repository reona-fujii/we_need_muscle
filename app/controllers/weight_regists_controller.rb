class WeightRegistsController < ApplicationController

  def create
    weight_regist = WeightRegist.new(weight_regist_params)
    weight_regist.day = Date.today
    weight_regist.user_id = current_user.id
    weight_regist.save
    redirect_to my_page_path
  end


  def weight_regist_params
    params.require(:weight_regist).permit(:weight)
  end
end
