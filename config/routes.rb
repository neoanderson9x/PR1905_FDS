Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users

  namespace :admin do
    resources :users
  end
end
