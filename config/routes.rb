Rails.application.routes.draw do

  root to: "home#index"

  get "/pieces" => "pieces#index"

  get "/artists/:id" => "artists#show"

  get "sign_up" => "users#new", :as => "sign_up"
  resources :users

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  resources :sessions
  # post "/pieces" => "pieces#create"

  # get "/pieces/:id" => "pieces#show"

  # get "/pieces/:id/edit" => "pieces#edit"


  # get "/hosts" => "hosts#index"  

  # post "/events" => "events#create"

  get "/hosts/:id" => "hosts#show"

  
  # get "/venues" => "venues#index"

  post "/venues" => "venues#create"

  # get "/venues/:id" => "venues#show"

  # get "/venues/:id/edit" => "venues#edit"



  get "/events" => "events#index"  

  # post "/events" => "events#create"

  get "/events/:id" => "events#show"

  # get "/events/:id/edit" => "events#edit"

end
