Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check # returns 500 if the app boots with exceptions, otherwise 200
end
