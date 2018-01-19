class StaticPagesController < ApplicationController
  def home
    @films = Film.film_show.order(:created_at)
  end

  def priceTicket; end

  def schedule; end
end
