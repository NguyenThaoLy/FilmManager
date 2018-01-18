class CategoriesController < ApplicationController
  before_action :find_Category, only: [:edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.category_info.order(:id).page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:notice] = t"controllers.categories_controller.notice"
      redirect_to categories_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:notice1] = t"controllers.categories_controller.notice1"
      redirect_to categories_url
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice2] = t"controllers.categories_controller.notice2"
      redirect_to categories_url
    else
      flash[:danger] = t"controllers.categories_controller.danger"
      redirect_to categories_url
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def find_Category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:error] = t"controllers.categories_controller.error"
    redirect_to root_path
  end
end
