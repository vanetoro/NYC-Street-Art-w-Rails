Rails.application.routes.draw do
  get '/', to: 'application#welcome'
  get 'neighborhoods/top_3', to: 'neighborhoods#top3'
  get 'artists/most_popular', to: 'artists#popular'

  resources :murals, only: [:index, :new, :create, :update]
  resources :artists, only: [:index, :show, :new, :create, :update]
  resources :neighborhoods, only:[:index, :show]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]

  resources :artists do
    resources :murals, only: [:show, :new, :edit, :show]
  end
end
