class StaticPagesController < ApplicationController
  def home
    if user_signed_in? && !current_user.try(:admin?)
      @films = Film.film_show.order(:created_at)
    elsif current_user.try(:admin?)
      redirect_to films_url
    else
      @films = Film.film_show.order(:created_at)
    end
  end

  def priceTicket; end

  def scheduleFilm
    Array @brr = Schedule.date
  end
end
