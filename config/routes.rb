Rails.application.routes.draw do
  root "articles#index"
  resources :authors do 
    resources :articles
  end
  # resources :authors do
  resources :articles do 
    resources :comments
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

end
