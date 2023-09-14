Rails.application.routes.draw do  
  resources :pet_posts do
    resources :pet_comments
    resources :pet_user_likes
  end
  get 'pages/index'  
  devise_for :pets_users
  root to: 'pages#index'
end
