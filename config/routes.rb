Rails.application.routes.draw do
  resources :companies do
    resources :jobs
    resources :contacts
  end
  resources :quotes
end
