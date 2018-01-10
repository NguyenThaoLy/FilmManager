class SearchesController < ApplicationController
  def index
    @q = Film.film_show.ransack params[:q]
    @films = @q.result.order(:created_at)
  end
end
