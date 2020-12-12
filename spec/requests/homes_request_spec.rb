require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'トップページ' do
    context 'トップページが正しく表示される' do
      before do
        get root_path
      end
      it 'リクエストは200 okとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include('We Need Muscle')
      end
    end
  end
  describe 'Aboutページ' do
    context 'Aboutページが正しく表示される' do
      before do
        get about_path
      end
      it 'リクエストは200 okとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されること' do
        expect(response.body).to include('食事投稿機能')
      end
    end
  end
end
