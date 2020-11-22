Rails.application.routes.draw do
  devise_for :users, skip: 'password'
  devise_scope :user do
    get 'users/password/edit', to: 'devise/password#edit', as: :edit_user_password
    patch 'users/password', to: 'devise/password#update'
    put 'users/password', to: 'devise/password#update'
    get 'users/password/new', to: 'devise/password#new', as: :new_user_password
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ユーザー
  get 'users/my_page', to: 'users#my_page', as: 'my_page'
  get 'users/my_page_edit', to: 'users#my_page_edit'
  get 'users/my_page_show', to: 'users#my_page_show'
  get 'users/:id', to: 'users#show', as: 'users_show'
  patch 'users/update', to: 'users#update'
  put 'users/update', to: 'users#update'

  # 投稿食事
  resources :post_foods do
    # コメント
    resources :food_comments, only: [:create, :destroy]
    # お気に入り
    resource :favorites, only: [:create, :destroy]
  end

  # 食事登録
  resources :food_regists, except: [:index, :destroy] do
    # 食事登録詳細
    resources :food_regist_shows, only: [:destroy]
  end

  # 食事登録カート
  delete 'food_regist_carts/destroy_all', to: 'food_regist_carts#destroy_all', as: 'food_regist_carts_destroy_all'
  resources :food_regist_carts, only: [:create, :destroy]

  # ホーム
  root 'homes#top'
  get 'about', to: 'homes#about'
  post 'guest', to: 'homes#new_guest'

  # 検索
  get 'search', to: 'searches#search'

  # お気に入り一覧画面
  get 'favorites', to: 'favorites#index'
end
