Rails.application.routes.draw do
  resources :pet_posts
  get 'pages/index'
  root to: 'pages#index'
  devise_for :pets_users
  
end
