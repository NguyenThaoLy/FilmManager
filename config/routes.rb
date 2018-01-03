Rails.application.routes.draw do
  root "static_pages#home"
  get  "/detailFilm", to: "static_pages#detailFilm"
  get  "/priceTicket", to: "static_pages#priceTicket"
  get  "/schedule", to: "static_pages#schedule"
end
