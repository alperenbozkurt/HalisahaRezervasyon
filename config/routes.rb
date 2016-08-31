Rails.application.routes.draw do
  devise_for :users
  resources :astroturves do
    resources :comments
  end
  resources :services
  root 'astroturves#index'
end
