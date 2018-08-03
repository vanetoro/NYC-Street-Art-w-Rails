Rails.application.routes.draw do
  get '/', to: 'application#welcome', as: 'root'
  get 'neighborhoods/top_3', to: 'neighborhoods#top3'
  get 'artists/most_popular', to: 'artists#popular'
  get '/signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/google_oauth2/callback', to: 'sessions#create'

  resources :murals, only: [:index, :new, :create, :update, :delete, :show]
  resources :artists, only: [:index, :show, :new, :create, :update]
  resources :neighborhoods, only:[:index, :show]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create, :edit, :update]

  resources :artists do
    resources :murals, only: [:show, :new, :edit, :show]
  end
end
