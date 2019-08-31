class SchedulesController < ApplicationController
  before_action :find_schedule, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @schedules = Schedule.schedule_info.order(:id).page params[:page]
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new schedule_params
    if @schedule.save
      flash[:notice] = t"controllers.schedules_controller.notice"
      redirect_to schedules_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @schedule.update_attributes schedule_params
      flash[:notice1] = t"controllers.schedules_controller.notice1"
      redirect_to schedules_path
    else
      render :edit
    end
  end

  def destroy
    if @schedule.destroy
      flash[:notice2] = t"controllers.schedules_controller.notice2"
      redirect_to schedules_path
    else
      flash[:danger] = t"controllers.schedules_controller.danger"
      redirect_to schedules_path
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit :time, :date, :price, :film_id
  end

  def find_schedule
    @schedule = Schedule.find_by id: params[:id]
    return if @schedule
    flash[:error] = t"controllers.schedules_controller.error"
    redirect_to schedules_path
  end
end
