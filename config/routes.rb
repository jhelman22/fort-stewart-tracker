Rails.application.routes.draw do
  root to: 'pages#home'

  resources :unit_closures
end
