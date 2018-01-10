class FilmsController < ApplicationController
  before_action :find_film, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def show
    @schedules = Schedule.includes(:film).find_by film_id: params[:id]
    @comments = Review.comment(params[:id]).page params[:page]
    @reviews = current_user.reviews.build if user_signed_in?
    Array @arr = Schedule.find_date(@film.id)
  end

  def index
    @films = Film.film_info.order(:id).page params[:page]
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new film_params
    if @film.save
      flash[:notice] = t"controllers.films_controler.notice"
      redirect_to films_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @film.update_attributes film_params
      flash[:notice1] = t"controllers.films_controler.notice1"
      redirect_to films_url
    else
      render :edit
    end
  end

  def destroy
    if @film.destroy
      flash[:notice2] = t"controllers.films_controler.notice2"
      redirect_to films_url
    else
      flash[:danger] = t"controllers.films_controler.danger"
      redirect_to films_url
    end
  end

  private

  def film_params
    params.require(:film).permit :name, :actor, :duration, :time, :directors, :detail, :status, :poster, :trailer, :category_id
  end

  def find_film
    @film = Film.find_by id: params[:id]
    return if @film
    flash[:error] = t"controllers.films_controler.error"
    redirect_to root_path
  end
end
