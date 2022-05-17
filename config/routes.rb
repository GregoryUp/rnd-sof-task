Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :news

  root to: "news#index"

  # authenticated :user do
  #   root to: "news#index"
  # end
  
  # unauthenticated :user do
  #   root to: "news#index"
  # end
  
  
end
