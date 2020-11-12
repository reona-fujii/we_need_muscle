class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, {only: [:edit, :destroy]}

  def my_page
  end

  def show
    @user = User.find(params[:id])
    @post_foods = PostFood.where(user_id: params[:id]).page(params[:page]).reverse_order
  end

  def my_page_edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:select_setting] == '0'
      selected_user_params = {
        last_name: user_params[:last_name],
        first_name: user_params[:first_name],
        email: user_params[:email],
        profile_image: user_params[:profile_image]
      }
      if @user.update(selected_user_params)
        redirect_to my_page_path
      else
        render :my_page_edit
      end
    elsif params[:select_setting] == '1'
      selected_user_params = {
        last_name: user_params[:last_name],
        first_name: user_params[:first_name],
        email: user_params[:email],
        profile_image: user_params[:profile_image],
        sex: user_params[:sex],
        weight: user_params[:weight],
        height: user_params[:height],
        exercise: user_params[:exercise],
        age: user_params[:age]
      }
      @user.update(selected_user_params)
      if @user.valid?(:step1)
        redirect_to my_page_path
      else
        render :my_page_edit
      end
    else params[:select_setting] == '2'
      selected_user_params = {
        last_name: user_params[:last_name],
        first_name: user_params[:first_name],
        email: user_params[:email],
        profile_image: user_params[:profile_image],
        calorie: user_params[:calorie],
        protain: user_params[:protain],
        fat: user_params[:fat],
        carbon: user_params[:carbon]
      }
      @user.update(selected_user_params)
      if @user.valid?(:step2)
        redirect_to my_page_path
      else
        render :my_page_edit
      end
    end
  end

  def destroy
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to post_foods_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :profile_image, :sex, :weight, :height, :exercise, :age, :calorie, :protain, :fat, :carbon)
  end

end
