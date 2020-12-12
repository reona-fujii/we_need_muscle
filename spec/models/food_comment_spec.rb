require 'rails_helper'

RSpec.describe FoodComment, type: :model do
  describe 'FoodCommentモデルのバリデーション' do
    it 'コメントがあれば投稿できる' do
      user = create(:user)
      post_food = create(:post_food, user_id: user.id)
      expect(FactoryBot.build(:food_comment, comment: 'おいしい', post_food_id: post_food.id, user_id: user.id)).to be_valid
    end
  end
end
