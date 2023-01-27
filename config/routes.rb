Rails.application.routes.draw do
  root 'pages#home'

  resources :airlines
  resources :airports
end
