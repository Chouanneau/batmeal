Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :meals do
    resources :ordered_meals, only: [:new, :create]
  end

  resources :orders do
    get "/confirmation", to: "orders#confirmation"
  end


  resources :users, only: [:new, :create] do
    collection do
      get "/edit_cook", to: "users#edit_cook"
      patch "/update_cook", to: "users#update_cook"
    end
  end

  get "/my_meals", to: "meals#my_meals"

end
