require 'rails_helper'

RSpec.describe 'PostFoods', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @post_food = FactoryBot.create(:post_food, user_id: @user.id)
    sign_in @user
  end
  describe '投稿一覧ページ' do
    context '投稿一覧ページが正しく表示される' do
      before do
        get post_foods_path
      end
      it 'リクエストが200 okになるか' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されるか' do
        expect(response.body).to include('投稿一覧')
      end
    end
  end
  describe '投稿詳細ページ' do
    context '投稿詳細ページが正しく表示される' do
      before do
        get post_food_path(@post_food)
      end
      it 'リクエストが200 okになるか' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されるか' do
        expect(response.body).to include(@post_food.name)
      end
    end
  end
  describe '新規投稿ページ' do
    context '新規投稿ページが正しく表示される' do
      before do
        get new_post_food_path
      end
      it 'リクエストが200 okになるか' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されるか' do
        expect(response.body).to include('新規投稿')
      end
    end
  end
  describe '新規投稿する' do
    context '新規投稿が成功した場合' do
      before do
        post post_foods_path, params: {
          post_food: {
            id: 100,
            user_id: @user.id,
            name: 'カレー',
            introduction: '美味しい',
            food_image: '',
            calorie: 1000,
            protain: 30,
            fat: 20,
            carbon: 100
          }
        }
      end
      it '正常に投稿できるか' do
        expect(PostFood.count).to eq(2)
      end
      it '新規投稿後、投稿一覧ページにリダイレクトされるか' do
        expect(response).to redirect_to post_foods_path
      end
      it '302のレスポンスが返ってくるか' do
        expect(response.status).to eq 302
      end
    end
    context '新規投稿が失敗した場合' do
      it '投稿失敗した場合、データベースに反映されないか' do
        post post_foods_path, params: {
          post_food: {
            id: 100,
            user_id: @user.id,
            name: '',
            introduction: '美味しい',
            food_image: '',
            calorie: 1000,
            protain: 30,
            fat: 20,
            carbon: 100
          }
        }
        expect(PostFood.count).to eq(1)
      end
    end
  end
  describe '投稿編集ページ' do
    context '投稿編集ページが正しく表示される' do
      before do
        get edit_post_food_path(@post_food)
      end
      it 'リクエストが200 okになるか' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されるか' do
        expect(response.body).to include('投稿食事編集')
      end
    end
  end
  describe '投稿食事の編集内容を更新する' do
    context '入力内容が正しい場合' do
      before do
        post_food_params = FactoryBot.attributes_for(:post_food, name: 'ラーメン')
        patch post_food_path(@post_food), params: {id: @post_food.id, post_food: post_food_params}
      end
      it '正常に更新されるか' do
        expect(@post_food.reload.name).to eq 'ラーメン'
      end
      it '正常に更新された後、詳細画面へリダイレクトするか' do
        expect(response).to redirect_to post_food_path(@post_food)
      end
      it '302のレスポンスを返すか' do
        expect(response.status).to eq 302
      end
    end
    context '入力内容が正しくない場合' do
      before do
        @post_food_params = FactoryBot.attributes_for(:post_food, name: '')
      end
      it '更新できないようになっているか' do
        patch post_food_path(@post_food), params: {id: @post_food.id, post_food: @post_food_params}
        expect(@post_food.reload.name).to eq 'そば'
      end
      it '編集ページへレンダーされるか' do
        patch post_food_path(@post_food), params: {id: @post_food.id, post_food: @post_food_params}
        expect(response.body).to include('投稿食事編集')
      end
    end
  end
  describe '投稿食事を削除する' do
    context '削除アクションが正しく動作する' do
      before do
        delete post_food_path(@post_food)
      end
      it '正常に削除されるか' do
        expect(PostFood.count).to eq(0)
      end
      it '削除した後、投稿一覧にリダイレクトするか' do
        expect(response).to redirect_to post_foods_path
      end
      it '302のレスポンスを返すか' do
        expect(response.status).to eq 302
      end
    end
  end
end
