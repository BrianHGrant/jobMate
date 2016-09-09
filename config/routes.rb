Rails.application.routes.draw do
  root :to => 'companies#index'
  resources :companies do
    resources :jobs
    resources :contacts
  end
  resources :quotes
  # resources :jobs
end
