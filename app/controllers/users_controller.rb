class UsersController < ApplicationController
  before_action :admin_user, only: [:index]
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

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t :welcome
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :username, :email, :phone, :address, :sex,
      :password, :password_confirmation
  end
end
