class ItemsController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@items = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  	@order_item = current_order.order_items.new
  end
end
