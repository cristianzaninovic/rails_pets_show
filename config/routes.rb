Rails.application.routes.draw do
  devise_for :pets_users
  get 'pages/index'
  root to: 'pages#index'

end
