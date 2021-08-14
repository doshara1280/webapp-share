Rails.application.routes.draw do
  devise_for :users
  root to: 'web_apps#index'
  resources :web_apps do
    collection do
      get 'description'
    end
    resources :comments, only: [:create]
  end
  resources :web_app_declarations, only: [:index, :new, :create, :show, :destroy]
end