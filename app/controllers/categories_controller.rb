class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :find_category, only: %i[show edit update destroy]
  before_action :find_categories

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      redirect_to categories_path, success: 'Your category was successfully saved!'
    else
      flash.now[:danger] = 'I was unable to save your category.'
      render :new
    end
  end

  def show
    @items = Item.where(category_id: [@category], status: [:approved])
  end

  def edit; end

  def update
    if @category.update category_params
      redirect_to categories_path, success: 'Your category was successfully saved!'
    else
      flash.now[:danger] = 'I was unable to update your category.'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Your category was successfully deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug)
  end

  def find_category
    @category = Category.friendly.find(params[:id])
  end

  def find_categories
    @categories = Category.all
  end
end
