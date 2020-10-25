class Admin::OrdersController < ApplicationController


  def index
  	@orders = Order.all.page(params[:page]).per(10)
  end

  def show
		@order = Order.find(params[:id])
		@order_details = @order.ordered_items
  end

  def update
		@order = Order.find(params[:id])
	  	if @order.update(order_params)
		   redirect_to admin_order_path(@order)
	  	else
		   render "show"
      end

  end

  private
	def order_params
		  params.require(:order).permit(:order_status)
	end

end
