Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :tribbles
  resources :snowflakes
  resources :diamonds
  resources :putties

  root 'welcome#index'
end
