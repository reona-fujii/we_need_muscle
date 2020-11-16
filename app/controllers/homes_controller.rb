class HomesController < ApplicationController
  
  # トップ画面
  def top
  end
  
  # アバウト画面
  def about
  end
  
  # ゲストログインする
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲスト"
      user.first_name = "ゲスト"
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
end
