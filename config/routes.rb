Rails.application.routes.draw do
  get 'artists/index'
  get 'artists/show'
  get '/', to: 'application#welcome'
  resources :murals, only: [:index, :new]
  resources :artists, only: [:index, :show]
end
