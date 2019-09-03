class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :admin_user, only: [:index]
  before_action :find_schedule, only: [:new, :show, :destroy]
  before_action :find_order, only: [:edit, :destroy, :update]

  def index
    @search = Order.order_info.ransack params[:q]
    @orders = @search.result.order(:id).page params[:page]
  end

  def cart
    @carts = current_user.orders.order(:id) if user_signed_in?
  end

  def edit; end

  def update
    if @order.update_attributes order_params
      flash[:success] = "Successfully order!"
      if current_user.admin?
        redirect_to orders_url
      else
        redirect_to cart_path
      end
    else
      render :edit
    end
  end

  def new
    unless @user
      flash[:danger] = t :notfind
      redirect_to root_url
    end
  end

  def show
    @order = Order.new
    if (I18n.l @schedule.date, format: "%d:%m:%Y") == (I18n.l Time.now, format: "%d:%m:%Y")
      if ((I18n.l @schedule.time, format: "%H%M").to_i - (I18n.l Time.now, format: "%H%M").to_i) <100
        flash[:danger] = "controllers.orders_controller.danger"
        redirect_to request.referrer
      end
    end
  end

  def create
    @order = Order.new order_params
    if @order.save
      flash[:success] = t ".booked"
      redirect_to cart_path
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = t "controllers.orders_controller.notice"
        if current_user.admin?
          redirect_to orders_url
        else
          redirect_to cart_path
        end
      end
      format.js
    end
  end

  def delete_multiple
    Order.where(id: params[:orders_ids]).destroy_all
    respond_to do |format|
      format.html do
        flash[:notice] = t "controllers.orders_controller.notice"
        redirect_to orders_url
      end
      format.js
    end
  end

  private
  def order_params
    params.require(:order).permit :user_id, :amount, :schedule_id
  end

  def find_schedule
    @schedule = Schedule.find_by id: params[:id]
    return if @schedule
    flash[:error] = t "controllers.schedules_controller.error"
    redirect_to schedules_path
  end

  def find_order
    @order = Order.find_by id: params[:id]
    return if @order
    flash[:failed]= "Not found order."
    redirect_to orders_url
  end
end
