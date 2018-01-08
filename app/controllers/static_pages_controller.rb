class StaticPagesController < ApplicationController
  def home
    @films = Film.film_show.order(:id)
  end

  def detailFilm
    @schedules = Schedule.includes(:film).find_by film_id: params[:id]
    @film = Film.film_show.find_by id: params[:id]
    if @film
      redirect_to root_path
    else
      flash[:error] = t"controllers.static_pages_controller.error"
    end
  end

  def priceTicket; end

  def schedule
    @schedules = Schedule.includes(:film).schedule_info.order(:id)
    @film = Film.find_by id: params[:id]
    if @film
      redirect_to root_path
    else
      flash[:error] = t"controllers.static_pages_controller.error"
    end
  end
end
