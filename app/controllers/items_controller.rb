class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_item, only: %i[show edit update destroy]

  def index
    @items = Item.all.order('created_at DESC')
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
      render :new, danger: 'Item not created'
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to @item, success: 'Item successfully updated'
    else
      render :edit, danger: 'Item not updated'
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, success: 'Item successfully deleted'
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :image_url, :price, :current_user)
  end
end
