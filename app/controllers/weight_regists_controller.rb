class WeightRegistsController < ApplicationController

  def create
    weight_regist = WeightRegist.new(weight_regist_params)
    weight_regist.user_id = current_user.id
    if current_user.weight_regists.present?(day: weight_regist.day)
      weight_regist.update
      redirect_to my_page_path
    else
      weight_regist.save
      redirect_to my_page_path
    end
    # weight_regist.create_or_update_by(weight_regist_params)
    # redirect_to my_page_path
  end

  def destroy
  end

  private
  def weight_regist_params
    params.require(:weight_regist).permit(:day, :weight)
  end
end
