Rails.application.routes.draw do
  resources :astroturves
  root 'astroturves#index'
end
