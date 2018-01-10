Rails.application.routes.draw do
  root "static_pages#home"
  get  "/detailFilm", to: "static_pages#detailFilm"
  get  "/priceTicket", to: "static_pages#priceTicket"
  get  "/schedule", to: "static_pages#schedule"
  get "/bookticket", to: "static_pages#bookticket"
  get "search", to: "searches#index"
  get "search_results", to: "searches#show"
  devise_for :users
  resources :users
  resources :orders
  resources :films
  resources :categories
  resources :schedules
  resources :reviews
end
