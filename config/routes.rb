Rails.application.routes.draw do
  get 'home/show'
  root to: 'home#show'
  resources :locations, only: %I[index show]
  match 'stations', to: 'stations#index', via: %I[get post]
  match 'stations/:id', to: 'stations#show', via: %I[get post]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
