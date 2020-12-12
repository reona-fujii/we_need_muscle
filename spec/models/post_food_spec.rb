require 'rails_helper'

RSpec.describe PostFood, type: :model do
  describe 'PostFoodモデルのバリデーション' do
    it '名前、紹介文、カロリー、マクロ栄養素があれば登録できる' do
      user = create(:user)
      expect(FactoryBot.build(:post_food, user_id: user.id)).to be_valid
    end
    it '名前がなければ登録できない' do
      expect(FactoryBot.build(:post_food, name: '')).to_not be_valid
    end
    it '紹介文がなければ登録できない' do
      expect(FactoryBot.build(:post_food, introduction: '')).to_not be_valid
    end
    it 'カロリーがなければ登録できない' do
      expect(FactoryBot.build(:post_food, calorie: '')).to_not be_valid
    end
    it 'たんぱく質がなければ登録できない' do
      expect(FactoryBot.build(:post_food, protain: '')).to_not be_valid
    end
    it '脂質がなければ登録できない' do
      expect(FactoryBot.build(:post_food, fat: '')).to_not be_valid
    end
    it '炭水化物がなければ登録できない' do
      expect(FactoryBot.build(:post_food, carbon: '')).to_not be_valid
    end
    it 'カロリーは0以上の数値でなければ登録できない' do
      expect(FactoryBot.build(:post_food, calorie: -50)).to_not be_valid
    end
    it 'たんぱく質は0以上の数値でなければ登録できない' do
      expect(FactoryBot.build(:post_food, protain: -50)).to_not be_valid
    end
    it '脂質は0以上の数値でなければ登録できない' do
      expect(FactoryBot.build(:post_food, fat: -50)).to_not be_valid
    end
    it '炭水化物は0以上の数値でなければ登録できない' do
      expect(FactoryBot.build(:post_food, carbon: -50)).to_not be_valid
    end
    it 'カロリーは整数でなければ登録できない' do
      expect(FactoryBot.build(:post_food, calorie: 50.5)).to_not be_valid
    end
    it 'たんぱく質は整数でなければ登録できない' do
      expect(FactoryBot.build(:post_food, protain: 50.5)).to_not be_valid
    end
    it '脂質は整数でなければ登録できない' do
      expect(FactoryBot.build(:post_food, fat: 50.5)).to_not be_valid
    end
    it '炭水化物は整数でなければ登録できない' do
      expect(FactoryBot.build(:post_food, carbon: 50.5)).to_not be_valid
    end
  end
end
