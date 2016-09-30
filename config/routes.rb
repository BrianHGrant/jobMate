Rails.application.routes.draw do
  devise_for :users
  root to: "landing#index"
  resources :companies do
    resources :jobs, :except => :index do
      resources :analyses
    end
  end
  resources :contacts
  resources :jobs, :only => :index
  resources :users, :only => :show
end
