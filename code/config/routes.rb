Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'flights#show'
  get '/flights', to: 'flights#show'
  #resources :bookings
  get '/bookings', to: 'bookings#show'
  get '/bookings/new', to: 'bookings#new'
  get '/bookings/create', to: 'bookings#create'
end
