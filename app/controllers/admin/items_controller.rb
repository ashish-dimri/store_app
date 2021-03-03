class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin!
  skip_before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item added!"
      redirect_to admin_items_path
    else
      flash[:notice] = "Item can't be blank!"
      render 'admin/items/new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "Item updated!"
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def destroy
    Item.destroy(params[:id])
    flash[:notice] = "Item removed!"
    redirect_to admin_items_path
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :price, :quantity)
    end
end
