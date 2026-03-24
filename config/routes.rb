Rails.application.routes.draw do
  get "dashboard/index"
  devise_for :users
  root "dashboard#index"

  resources :coffee_beans
  resources :brew_notes
  resources :cafe_shops
end