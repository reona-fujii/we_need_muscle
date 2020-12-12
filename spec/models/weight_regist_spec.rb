require 'rails_helper'

RSpec.describe WeightRegist, type: :model do
  describe 'WeightRegistモデルのバリデーション' do
    it '今日の体重が入力されていれば登録できる' do
      user = create(:user)
      expect(FactoryBot.build(:weight_regist, user_id: user.id)).to be_valid
    end
    it '今日の体重がなければ登録できない' do
      user = create(:user)
      expect(FactoryBot.build(:weight_regist, user_id: user.id, weight: '')).to_not be_valid
    end
  end
end
