class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @reviews = current_user.reviews.build review_params
    if @reviews.save
      flash[:success] = t"controllers.reviews_controller.success"
      redirect_to film_path(@reviews.film)
    else
      flash[:error] = t"controllers.reviews_controller.error"
      redirect_to film_path(@reviews.film)
    end
  end

  def destroy
    @reviews = Review.find_by id: params[:id]
    if @reviews.destroy
      flash[:deleted] = t"controllers.reviews_controller.deleted"
      redirect_to request.referrer || film_path(@reviews.film)
    else
      flash[:fail] = t"controllers.reviews_controller.fail"
      redirect_to request.referrer || film_path(@reviews.film)
    end
  end

  private

  def review_params
    params.require(:review).permit :content, :film_id
  end

  def correct_user
    @review = current_user.reviews.find_by id: params[:id]
    return if @review
      flash[:fail] = t"controllers.reviews_controller.fail"
      redirect_to request.referrer || film_path(@reviews.film)
  end
end
