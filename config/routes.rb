Rails.application.routes.draw do
  get 'welcome/index'

  resources :tribbles
  resources :snowflakes
  resources :diamonds
  resources :putties

  root 'welcome#index'

end
