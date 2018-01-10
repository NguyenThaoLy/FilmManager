class UsersController < ApplicationController
  before_action :admin_user, only: [:index, :destroy]
  def index
    @users = User.user_info.order(:id).page params[:page]
  end

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t :notfind
      redirect_to root_url
    end
  end

  def destroy
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t :notfind
      redirect_to root_url
    end
    @user.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = t "controllers.users_controller.notice"
        redirect_to users_url
      end
      format.js
    end
  end
end
