Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check # returns 500 if the app boots with exceptions, otherwise 200

  root to: "products#index"

  get "cart", to: "orders#edit"
  resource :order, only: :create do
    scope module: :orders do
      resources :items, only: [:create, :update, :destroy]
    end
  end
end
