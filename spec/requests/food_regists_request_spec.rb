require 'rails_helper'

RSpec.describe 'FoodRegists', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post_food = FactoryBot.create(:post_food, user_id: @user.id)
    @food_regist_cart = FactoryBot.create(:food_regist_cart, user_id: @user.id, post_food_id: @post_food.id)
    sign_in @user
  end
  describe '食事登録画面' do
    before do
      get new_food_regist_path
    end
    context '食事登録画面が正しく表示される' do
      it 'リクエストが200 okとなるか' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されるか' do
        expect(response.body).to include('食事登録')
      end
    end
    context '登録確定が正しく動作した場合' do
      before do
        post food_regists_path, params: {
          food_regist: {
            id: 1,
            user_id: @user.id,
            day: '2020/12/12',
            timing: '朝食'
          }
        }
      end
      it 'マイページへリダイレクトされるか' do
        expect(response).to redirect_to my_page_path
      end
      it 'リクエストが302 okとなるか' do
        expect(response.status).to eq 302
      end
      it 'データベースに反映されるか' do
        expect(FoodRegist.count).to eq(1)
      end
    end
    context '登録が失敗した場合' do
      before do
        post food_regists_path, params: {
          food_regist: {
            id: 10,
            user_id: @user.id,
            day: '2020/12/12',
            timing: ''
          }
        }
      end
      it '食事登録画面へレンダーされるか' do
        expect(response.body).to include('食事登録')
      end
      it 'リクエストが200 okとなるか' do
        expect(response.status).to eq 200
      end
      it 'データベースに反映されないか' do
        expect(FoodRegist.count).to eq(0)
      end
    end
  end
  describe '食事登録詳細画面' do
    context '食事登録詳細画面が正しく表示される' do
      before do
        @food_regist = FactoryBot.create(:food_regist, user_id: @user.id)
        @food_regist_show = FactoryBot.create(:food_regist_show,
                                              food_regist_id: @food_regist.id,
                                              post_food_id: @post_food.id)
        get food_regist_path(@food_regist)
      end
      it 'リクエストが200 okとなるか' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されるか' do
        expect(response.body).to include('食事登録詳細')
      end
    end
  end
  describe '食事登録編集画面' do
    context '食事登録編集画面が正しく表示される' do
      before do
        @food_regist = FactoryBot.create(:food_regist, user_id: @user.id)
        get edit_food_regist_path(@food_regist)
      end
      it 'リクエストが200 okとなるか' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されるか' do
        expect(response.body).to include('食事登録編集')
      end
    end
    context '入力内容が正しい場合、更新が正しく機能する' do
      before do
        @food_regist = FactoryBot.create(:food_regist, user_id: @user.id)
        @food_regist_show = FactoryBot.create(:food_regist_show,
                                              food_regist_id: @food_regist.id,
                                              post_food_id: @post_food.id)
        patch food_regist_path(@food_regist), params: {
          food_regist: {
            id: @food_regist.id,
            user_id: @user.id,
            day: '2020/10/10',
            timing: '朝食'
          }
        }
      end
      it '正常に更新されるか' do
        expect(@food_regist.reload.day).to eq Date.new(2020, 10, 10)
      end
      it '正常に更新された後、マイページへリダイレクトするか' do
        expect(response).to redirect_to my_page_path
      end
      it 'リクエストが302 okになるか' do
        expect(response.status).to eq 302
      end
    end
    context '入力内容が正しくない場合、' do
      before do
        @food_regist = FactoryBot.create(:food_regist, user_id: @user.id)
        @food_regist_show = FactoryBot.create(:food_regist_show,
                                              food_regist_id: @food_regist.id,
                                              post_food_id: @post_food.id)
        patch food_regist_path(@food_regist), params: {
          food_regist: {
            id: @food_regist.id,
            user_id: @user.id,
            day: '2020/12/10',
            timing: ''
          }
        }
      end
      it 'データベースが更新されないか' do
        expect(@food_regist.timing).to eq '朝食'
      end
      it '編集ページへレンダーされるか' do
        expect(response.body).to include('食事登録編集')
      end
    end
  end
end
