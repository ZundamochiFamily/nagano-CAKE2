class Admin::OrdersController < ApplicationController

  def index
  	@orders = Order.all.page(params[:page]).per(10)
  end

  def show
		@order = Order.find(params[:id])
		@order_details = @order.ordered_items
		# @tax_included_price = @order_details.tax_excluded_price*1.1
		@shipping = 800
		# @total = []
		# @order.ordered_items.each do |order_item|
		# 	@total << order_item.quantity * order_item.item.tax_excluded_price
<<<<<<< HEAD
		end
=======
  end
>>>>>>> 7ab09a4c272b20ed88a1bfdc1db21c3efefd71e7

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
