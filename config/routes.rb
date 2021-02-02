Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :home, only: [:index] do
    collection do
      get 'stores'
    end
  end
 resources :admin, only: [:index]
 namespace :admin do
  resources :blogs
  resources :users
  resources :categories
  resources :stores
 end
 resources :blogs
 resources :stores
 resource :profile
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
