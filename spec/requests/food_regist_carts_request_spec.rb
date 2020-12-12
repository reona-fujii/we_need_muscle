require 'rails_helper'

RSpec.describe 'FoodRegistCarts', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post_food = FactoryBot.create(:post_food, user_id: @user.id)
    sign_in @user
    post food_regist_carts_path(post_food_id: @post_food.id), params: {
      food_regist_cart: {
        id: 10,
        user_id: @user.id,
        post_food_id: @post_food.id
      }
    }
  end
  describe '食事登録カートに関する機能' do
    context 'カートへ追加が正しく動作する' do
      it 'カートに正常に追加でき、302のレスポンスを返すか' do
        change(FoodRegistCart, :count).by(1)
        expect(response.status).to eq 302
      end
      it 'カート追加後、食事登録画面にリダイレクトするか' do
        expect(response).to redirect_to new_food_regist_path
      end
    end
    context 'カートから削除が正しく動作する' do
      it 'カートから正常に削除でき、302のレスポンスを返すか' do
        delete food_regist_cart_path(id: @post_food.id)
        expect(FoodRegistCart.count).to eq(0)
        expect(response.status).to eq 302
      end
      it 'カートから削除後、食事登録画面にリダイレクトするか' do
        expect(response).to redirect_to new_food_regist_path
      end
      it 'カートから全て削除でき、302のレスポンスを返すか' do
        post food_regist_carts_path(post_food_id: @post_food.id), params: {
          food_regist_cart: {
            id: 20,
            user_id: @user.id,
            post_food_id: @post_food.id
          }
        }
        delete food_regist_carts_destroy_all_path
        expect(FoodRegistCart.count).to eq(0)
        expect(response.status).to eq 302
      end
    end
  end
end
