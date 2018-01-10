class StaticPagesController < ApplicationController
  def home
    @films = Film.film_show.order(:id)
  end

  def priceTicket; end

  def schedule; end
end
