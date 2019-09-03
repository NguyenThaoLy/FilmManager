class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  before_action :find_review, only: :destroy

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      respond_to do |format|
        format.html do
          flash[:success] = t "controllers.reviews_controller.success"
          redirect_to film_path @review.film
        end
        format.js
      end
    else
      flash[:error] = t "controllers.reviews_controller.error"
      redirect_to root_path
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html do
        flash[:deleted] = t "controllers.reviews_controller.success"
        redirect_to film_path @review.film
      end
      format.js
    end
  end

  private
  def review_params
    params.require(:review).permit :content, :film_id
  end

  def correct_user
    @review = current_user.reviews.find_by id: params[:id]
    return if @review
    flash[:failed] = t "controllers.reviews_controller.fail"
    redirect_to film_path @review.film
  end

  def find_review
    @review = Review.find_by id: params[:id]
    return if @review
    flash[:notice] = t "controllers.reviews_controller.error"
    redirect_to root_path
  end
end
