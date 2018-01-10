class StaticPagesController < ApplicationController
  def home
    @films = Film.film_show.order(:created_at)
  end

  def priceTicket; end

  def schedule
    Array @brr = Schedule.date
  end
end
