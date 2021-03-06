Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  devise_for :users
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :figurines, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    put :favorite, on: :member
    resources :likes, only: [:create, :index, :destroy]
      resources :reviews, only: [:new, :create, :update]
  	  	member do
  		get 'media'
  	end
  end
  resources :reviews, only: :destroy
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  resources :profiles, only: [:index, :show, :update]
  get '/profile', to: 'profiles#profile'
  resources :favourites, only: :destroy
end
