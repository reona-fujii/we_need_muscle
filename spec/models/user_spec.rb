require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Userモデルのバリデーション' do
    let(:user) { FactoryBot.build(:user) }
    it '姓と名、メールアドレスとパスワードがあれば新規登録できる' do
      expect(user).to be_valid
    end
    it '姓がなければ登録できない' do
      expect(FactoryBot.build(:user, last_name: '')).to_not be_valid
    end
    it '名がなければ登録できない' do
      expect(FactoryBot.build(:user, first_name: '')).to_not be_valid
    end
    it 'メールアドレスがなければ登録できない' do
      expect(FactoryBot.build(:user, email: '')).to_not be_valid
    end
    it 'メールアドレスが使用済みならば登録できない' do
      user1 = FactoryBot.create(:user, email: 'hoge@test')
      expect(FactoryBot.build(:user, email: user1.email)).to_not be_valid
    end
    it 'メールアドレスに＠がなければ登録できない' do
      expect(FactoryBot.build(:user, email: 'testtest')).to_not be_valid
    end
    it 'パスワードがなければ登録できない' do
      expect(FactoryBot.build(:user, password: '')).to_not be_valid
    end
    it 'パスワードが暗号化されているか' do
      user = create(:user)
      expect(user.encrypted_password).to_not eq 'testtest'
    end
    it '確認用パスワードがパスワードと異なる場合は登録できない' do
      expect(FactoryBot.build(:user, password: 'testtest', password_confirmation: 'hogetest')).to_not be_valid
    end
  end
end
