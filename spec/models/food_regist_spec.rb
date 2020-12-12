require 'rails_helper'

RSpec.describe FoodRegist, type: :model do
  describe 'FoodRegistモデルのバリデーション' do
    it '日付とタイミングがあれば登録できる' do
      user = create(:user)
      expect(FactoryBot.build(:food_regist, user_id: user.id)).to be_valid
    end
    it '日付がなければ登録できない' do
      expect(FactoryBot.build(:food_regist, day: '')).to_not be_valid
    end
    it 'タイミングがなければ登録できない' do
      expect(FactoryBot.build(:food_regist, timing: '')).to_not be_valid
    end
  end
end
