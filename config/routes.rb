Rails.application.routes.draw do

  get 'items/index' => 'items#index'
  get "items/about" => "items#about", as: "about"
  get "items/tag_index" => "items#tag_index"
  get "search_tag"=>"items#search_tag"
  # get 'unsubscribe/:id' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  # patch ':id/withdraw/:id' => 'users#withdraw', as: 'withdraw_user'
  # put 'withdraw/:id' => 'users#withdraw'

  root to: "items#index"

  devise_for :admins
  devise_for :users

  resources :items, only: [:new, :index, :show, :edit, :create, :destroy]do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :customers, only: [:index, :show, :edit]
  resources :users, only: [:show, :edit, :update, :index]

  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
