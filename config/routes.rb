Rails.application.routes.draw do
  get '/', to: 'application#welcome', as: 'root'
  get '/history', to: 'application#history'
  get 'neighborhoods/top_3', to: 'neighborhoods#top3'
  get 'artists/most_popular', to: 'artists#popular'
  get '/signout', to: 'sessions#destroy', as: 'signout'
  


  resources :murals, only: [:index, :new, :create, :update, :show]
  resources :artists, only: [:index, :show, :new, :create, :update]
  resources :neighborhoods, only:[:index, :show]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create, :edit, :update]
  get 'auth/google_oauth2/callback', to: 'sessions#create'
  resources :artists do
    resources :murals, only: [:show, :new, :edit, :show]
  end
end
