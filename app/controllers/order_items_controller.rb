class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_params)
    @order.user = current_user
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    if @order_item.update_attributes(order_params)
    	@order_items = current_order.order_items
    	respond_to do |format|
	    	format.js
	    end
    end
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    if @order_item.destroy
    	@order_items = current_order.order_items
    	respond_to do |format|
	    	format.js
	    end
    end
  end

  def checkout
  	debugger
  	session[:order_id] = ""
  end

  private

  def order_params
  	debugger
    params.require(:order_item).permit(:item_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
