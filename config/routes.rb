Rails.application.routes.draw do

  get 'items/top' => 'items#top'
  get "items/about" => "items#about", as: "about"

  root to: "items#top"

  devise_for :admins
  devise_for :users

  resources :items, only: [:new, :index, :show, :edit, :create, :destroy]do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :customers, only: [:index, :show, :edit]
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
