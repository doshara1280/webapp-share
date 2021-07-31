Rails.application.routes.draw do
  devise_for :users
  root to: 'web_apps#index'
  resources :web_apps do
    resources :comments, only: [:create]
  end
end