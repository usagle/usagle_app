class Admin::ItemsController < Admin::BaseController
  before_action :find_item, only: %i[show edit update destroy]
  before_action :find_categories
  before_action :find_statuses, only: %i[new create]

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
      redirect_to admin_items_path, success: 'Item successfully created'
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
      redirect_to admin_items_path, success: 'Item successfully updated'
    else
      flash.now[:danger] = 'Item not updated'
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to admin_items_path, success: 'Item successfully deleted'
  end

  private

  def find_categories
    @categories = Category.all
  end

  def find_item
    @item = Item.friendly.find(params[:id])
  end

  def find_statuses
    @statuses = Item.all.statuses
  end

  def item_params
    params.require(:item).permit(:title, :description, :price, :current_user, :slug, :image, :category_id, :status)
  end
end
