Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root "static_pages#home"
  get  "/detailFilm", to: "static_pages#detailFilm"
  get  "/priceTicket", to: "static_pages#priceTicket"
  get  "/scheduleFilm", to: "static_pages#scheduleFilm"
  get "/bookticket", to: "static_pages#bookticket"
  get "/search", to: "searches#index"
  get "/films", to: "films#index"
  get "/cart", to: "orders#cart"
  devise_for :users
  resources :users
  resources :reviews

  resources :orders do
    collection do
      delete "delete_multiple"
    end
  end

  resources :films

  resources :categories do
    collection do
      post :edit_multiple
      put :update_multiple
    end
  end

  resources :schedules do
    collection do
      delete "delete_multiple"
    end
  end
end
