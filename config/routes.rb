Rails.application.routes.draw do
  devise_for :users
  root to: "landing#index"
  resources :companies do
    resources :jobs, :except => :index
    resources :contacts, :except => :index
  end
  resources :contacts, :only => :index
  resources :jobs, :only => :index
  resources :users, :only => :show
end
