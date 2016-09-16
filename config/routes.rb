Rails.application.routes.draw do
  root :to => 'companies#index'
  resources :companies do
    resources :jobs, :except => :index
    resources :contacts, :except => :index
  end
  resources :quotes
  resources :contacts, :only => :index
  resources :jobs, :only => :index
end
