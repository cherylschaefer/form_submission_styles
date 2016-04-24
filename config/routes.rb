Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :tribbles, except: [:index, :show]
  resources :snowflakes, only: [:new, :create, :destroy]
  resources :diamonds, only: [:new, :create, :destroy]
  resources :putties, only: [:edit, :update]

  root 'welcome#index'
end
