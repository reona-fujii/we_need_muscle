require 'rails_helper'

RSpec.describe 'FoodRegistShows', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post_food = FactoryBot.create(:post_food, user_id: @user.id)
    @food_regist = FactoryBot.create(:food_regist, user_id: @user.id)
    @food_regist_show = FactoryBot.create(:food_regist_show,
                                          food_regist_id: @food_regist.id,
                                          post_food_id: @post_food.id)
    sign_in @user
  end
  describe '食事登録編集画面' do
    context '登録品数が1品の場合' do
      before do
        delete food_regist_food_regist_show_path(food_regist_id: @food_regist.id, id: @food_regist_show.id)
      end
      it '食事登録詳細を正常に削除できるか' do
        expect(FoodRegistShow.count).to eq(0)
      end
      it '食事登録も削除されるか' do
        expect(FoodRegist.count).to eq(0)
      end
      it 'リクエスト302を返すか' do
        expect(response.status).to eq 302
      end
      it '削除後、マイページにリダイレクトするか' do
        expect(response).to redirect_to my_page_path
      end
    end
    context '登録品数が複数の場合' do
      it '削除後、編集画面にリダイレクトするか' do
        @another_food_regist_show = FactoryBot.create(:food_regist_show,
                                                      food_regist_id: @food_regist.id,
                                                      post_food_id: @post_food.id)
        delete food_regist_food_regist_show_path(food_regist_id: @food_regist.id, id: @food_regist_show.id)
        expect(response).to redirect_to edit_food_regist_path(@food_regist)
      end
    end
  end
end
