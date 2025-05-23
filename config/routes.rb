Rails.application.routes.draw do
  resources :life_expectancies
  resources :variants
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :weeks_in_lives
      put "weeks_in_lives/memo/:id", to: "weeks_in_lives#update_week_rating_and_memo"
      get "accounts/info", to: "accounts#account_info"
      put "accounts/dates", to: "accounts#update_dates"
      resources :life_expectancies
      resources :variants
      resources :locations
    end
  end

end
