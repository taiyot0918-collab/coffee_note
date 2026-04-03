Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"

  resources :coffee_beans
  resources :brew_notes
  resources :cafe_shops

  # ゲストログイン用ルート
  post "users/guest_sign_in", to: "users#guest_sign_in", as: :guest_sign_in
end