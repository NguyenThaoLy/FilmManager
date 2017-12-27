class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:show]
  before_action :admin_user, only: [:index]

  def index
    @orders = Order.order_info.order(:id).page params[:page]
  end

  def new
    @schedules = Schedule.find_by id: params[:id]
    unless @user
      flash[:danger] = t :notfind
      redirect_to root_url
    end
  end

  def show
    @schedules = Schedule.find_by id: params[:id]
    @orders = Order.new
  end

  def create
    @orders = Order.new order_params
    if @orders.save
      flash[:success] = t(".booked")
      redirect_to root_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :amount, :schedule_id)
  end
end
