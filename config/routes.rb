Rails.application.routes.draw do
  devise_for :users

  resources :tracks do
    resources :comments
  	member do
  		put :like, to:'tracks#upvote'
  		put :dislike, to:'tracks#downvote'
  	end
  end

  root 'tracks#index'

  get '/toptracks', to: 'pages#toptracks', as: 'toptracks'
  get '/randomtracks', to: 'pages#randomtracks', as: 'randomtracks'
  get '/category/:id', to: 'categories#show', as: 'category'
end
