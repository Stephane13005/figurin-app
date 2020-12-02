Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :figurines, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  	  	member do
  		get 'media'
  	end
  end
  resources :profiles, only: [:show, :update]
  get '/profile', to: 'profiles#profile'
end
