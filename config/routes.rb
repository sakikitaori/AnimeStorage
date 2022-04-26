Rails.application.routes.draw do
  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
  get 'items/top'
  get 'items/about'
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  get 'items/top' => 'items#top'
  get 'items/about'
  get 'items/index'
  get 'items/show'

  root to: "items#top"

  devise_for :admins
  devise_for :users



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
