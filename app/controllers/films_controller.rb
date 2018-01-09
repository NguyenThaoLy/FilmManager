class FilmsController < ApplicationController
  def show
    @film = Film.find_by id: params[:id]
    @schedules = Schedule.includes(:film).find_by film_id: params[:id]
  end
end
