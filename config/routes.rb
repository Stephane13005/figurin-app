Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :figurines, only: [:index, :show]
  resources :users do
    resources :profiles, only: [:show, :new, :create]
end
end
