Rails.application.routes.draw do
  root 'astroturves#index'
  devise_for :users
  resources :astroturves do
    resources :comments
    resources :votes
  end
  resources :services
end
