Rails.application.routes.draw do
  devise_for :users
  resources :astroturves do
    resources :comments
  end
  root 'astroturves#index'
end
