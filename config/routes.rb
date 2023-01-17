Rails.application.routes.draw do
  devise_for :users # sign in, sign out, etc, email, pw, etc
  resources :actors
  resources :directors
  root "movies#index"
  
  resources :movies
end
