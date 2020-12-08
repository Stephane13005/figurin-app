Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
end
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :figurines, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    put :favorite, on: :member
      resources :reviews, only: [ :new, :create ]
  	  	member do
  		get 'media'
  	end
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
  resources :profiles, only: [:index, :show, :update]
  get '/profile', to: 'profiles#profile'
  resources :favourites, only: :destroy
end
