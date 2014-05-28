Rails.application.routes.draw do

  root to: "home#index"

  # resources :pieces

  #get "/artists/:id" => "artists#show"
  resources :artists, only: [:show]

  #get "/hosts/:id" => "hosts#show"
  resources :hosts, only: [:show]

  get "/sign_up" => "users#new", :as => "sign_up"
  resources :users do
    resources :pieces
  end


  get "/log_out" => "sessions#destroy", :as => "log_out"
  get "/log_in" => "sessions#new", :as => "log_in"
  resources :sessions
  # post "/pieces" => "pieces#create"

  # get "/pieces/:id" => "pieces#show"

  # get "/pieces/:id/edit" => "pieces#edit"


  # get "/hosts" => "hosts#index"  

  # post "/events" => "events#create"

  
  # get "/venues" => "venues#index"

  post "/venues" => "venues#create"

  # get "/venues/:id" => "venues#show"

  # get "/venues/:id/edit" => "venues#edit"


  resources :events
  # get "/events" => "events#index"  

  # # post "/events" => "events#create"

  # get "/events/:id" => "events#show"

  # get "/events/:id/edit" => "events#edit"

end
