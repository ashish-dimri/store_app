Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'

  resources :items, only: [:index, :show]
  resources :order_items do
    collection do
      get :checkout
    end
  end
  get 'cart', to: 'cart#show'

  namespace :admin do
    root to: 'items#index'
    resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
