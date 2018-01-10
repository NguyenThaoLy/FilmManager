Rails.application.routes.draw do
  root "static_pages#home"
  get  "/detailFilm", to: "static_pages#detailFilm"
  get  "/priceTicket", to: "static_pages#priceTicket"
  get  "/schedule", to: "static_pages#schedule"
  get "/bookticket", to: "static_pages#bookticket"
  get "sessions/new"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "search", to: "searches#index"
  get "search_results", to: "searches#show"
  resources :users
  resources :orders
  resources :films
  resources :users
  resources :films
  resources :categories
  resources :orders
  resources :schedules
end
