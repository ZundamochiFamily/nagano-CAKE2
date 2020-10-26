class Admin::OrdersController < ApplicationController

  def index
  	@orders = Order.all.page(params[:page]).reverse_order.per(10)
  end

  def show
		@order = Order.find(params[:id])
		@order_details = @order.ordered_items
		@shipping = 800
		@total = []
		tax = 1.1
		@order.ordered_items.each do |order_item|
			@total << order_item.quantity * (order_item.item.tax_excluded_price * tax).floor
		end
		@sub_total = @total.inject{|sum,n| sum + n}
		if @order.payment_method == 0
		  @payment_method = "クレジットカード"
		elsif @order.payment_method == 1
		  @payment_method = "銀行振込"
		end
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