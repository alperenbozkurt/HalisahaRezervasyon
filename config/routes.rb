Rails.application.routes.draw do
  root 'astroturves#index'
  devise_for :users
  resources :astroturves do
    resources :comments
    resources :votes
    resources :reservations, only: [:create, :update]
  end
  resources :services
  resources :reservations, only: [:index, :destroy]
end
