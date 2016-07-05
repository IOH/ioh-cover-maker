Rails.application.routes.draw do

  devise_for :users
  scope "/admin" do
    resources :users
  end
  
  resources :roles

  authenticated :user do
    root 'posters#index', as: :authenticated_root
  end
 
  # None user will be direct to log-in page
  root 'users#new'

  get 'tutorial' => 'tutorial#index', :as => "tutorial"

  # @editor w2sw2sw2s
  # @date 2016/1/27
  # @info Add sessions, users, and posters routes

  # get "signup" => "users#signup", :as => "signup"

  
  # @editor arfullight
  # @date   2016/2/15
  # @info   Add posters routes using resources

  resources :posters

  post "posters/search" => "posters#search", :as => "search"

  post "posters/download/:id" => "posters#download"

  namespace :admin do
  	get "/live" => "live#index"
  end

  namespace :api do
  	get "/live" => "live#index"
  end

end
