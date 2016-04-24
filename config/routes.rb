Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :tribbles, except: [:index, :show]
  resources :snowflakes, only: [:new, :create, :destroy]
  resources :diamonds
  resources :putties

  root 'welcome#index'
end
