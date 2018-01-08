class FilmsController < ApplicationController
  before_action :find_film, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:create, :edit, :update, :destroy]

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
    params.require(:film).permit!
  end

  def find_film
    @film = Film.find_by id: params[:id]
    if @film
      redirect_to root_path
    else
      flash[:error] = t"controllers.films_controler.error"
    end
  end
end
