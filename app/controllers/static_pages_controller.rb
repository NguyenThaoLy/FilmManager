class StaticPagesController < ApplicationController
  def home
    @films = Film.film_show.order(:id)
  end

  def priceTicket; end

  def schedule
    @schedules = Schedule.includes(:film).schedule_info.order(:id)
    @film = Film.find_by id: params[:id]
    return if @film
    flash[:error] = t"controllers.static_pages_controller.error"
    redirect_to root_path
  end
end
