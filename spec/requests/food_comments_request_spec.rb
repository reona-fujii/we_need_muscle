require 'rails_helper'

RSpec.describe 'FoodComments', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post_food = FactoryBot.create(:post_food, user_id: @user.id)
    sign_in @user
  end
  describe '投稿詳細ページ' do
    context 'コメント機能が正しく動作する' do
      it '入力値がある場合、投稿できるか' do
        post post_food_food_comments_path(post_food_id: @post_food.id), params: {
          food_comment: {
            id: 1,
            user_id: @user.id,
            post_food_id: @post_food.id,
            comment: 'おいしい'
          }
        }, xhr: true
        expect(FoodComment.count).to eq(1)
      end
      it '空の場合、投稿できないようになっているか' do
        post post_food_food_comments_path(post_food_id: @post_food.id), params: {
          food_comment: {
            id: 1,
            user_id: @user.id,
            post_food_id: @post_food.id,
            comment: ''
          }
        }, xhr: true
        expect(FoodComment.count).to eq(0)
      end
    end
  end
end
