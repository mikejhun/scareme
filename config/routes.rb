Rails.application.routes.draw do
  devise_for :users
  resources :tracks
  root 'tracks#index'
end
