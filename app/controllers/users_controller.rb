class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t :notfind
      redirect_to root_url
    end
  end
end
