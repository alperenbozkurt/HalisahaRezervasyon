Rails.application.routes.draw do
  devise_for :users
  resources :astroturves
  root 'astroturves#index'
end
