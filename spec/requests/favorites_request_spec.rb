require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post_food = FactoryBot.create(:post_food, user_id: @user.id)
    @favorite = FactoryBot.create(:favorite, user_id: @user.id, post_food_id: @post_food.id)
    sign_in @user
  end
  describe '投稿詳細ページ' do
    context 'お気に入り機能が正しく動作する' do
      it 'お気に入りに追加するが正常に動作するか' do
        post post_food_favorites_path(user_id: @user.id, post_food_id: @post_food.id), xhr: true
        expect(Favorite.count).to eq(2)
      end
      it 'お気に入りから削除するが正常に動作するか' do
        delete post_food_favorites_path(user_id: @user.id, post_food_id: @post_food.id), xhr: true
        expect(Favorite.count).to eq(0)
      end
    end
  end
end
