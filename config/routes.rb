Rails.application.routes.draw do
  get 'pages/index'
  root to: 'pages#index'
  devise_for :pets_users
  
end
