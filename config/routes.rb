Rails.application.routes.draw do

  root to: "home#index"

  get "/sign_up" => "users#new", :as => "sign_up"
  get "/log_out" => "sessions#destroy", :as => "log_out"
  get "/log_in" => "sessions#new", :as => "log_in"
  resources :sessions, except: [:new, :destroy]

  resources :artists, only: [:show]
  resources :hosts, only: [:show]

  resources :users do
    resources :pieces, shallow: true
    #resources :venues
  end

  post "/venues" => "venues#create"
  resources :events

end
