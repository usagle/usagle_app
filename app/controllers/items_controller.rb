class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_item, only: %i[show edit update destroy]
  before_action :find_categories

  def index
    @items = Item.where(status: :approved).order('created_at DESC')
  end

  def show; end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.item.new(item_params)
    if @item.save
      redirect_to items_path, success: 'Item successfully created'
    else
      flash.now[:danger] = 'Item not created'
      render :new
    end
  end

  def edit
    @statuses = Item.statuses
  end

  def update
    @statuses = Item.statuses
    if @item.update(item_params)
      redirect_to @item, success: 'Item successfully updated'
    else
      flash.now[:danger] = 'Item not updated'
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, success: 'Item successfully deleted'
  end

  private

  def find_categories
    @categories = Category.all
  end

  def find_item
    @item = Item.friendly.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :current_user, :slug, :image, :category_id, :status)
  end
end
