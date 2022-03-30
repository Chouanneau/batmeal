Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals, only: [:index, :show, :new, :create, :destroy]

  get "/my_meals", to: "meals#my_meals"
end
