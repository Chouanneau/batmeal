Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals
  resources :orders

  resources :users, only: [:new, :create]

  get "/users/:id/edit", to: "users#edit_user"
  get "/my_meals", to: "meals#my_meals"
end
