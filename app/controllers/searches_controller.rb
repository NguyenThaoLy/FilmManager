class SearchesController < ApplicationController
  def index
    @films = Film.search(params[:term]).order_by_name
    render json: @films.map {|film| film.name}
  end

  def show
    @films = Film.where(name: params[:term]).select(:name, :id, :poster)
  end
end
