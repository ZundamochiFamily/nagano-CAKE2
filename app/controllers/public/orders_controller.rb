class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    
  end
  
  def check
    @cart_items = Order.all
  end
  
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect to action: :thanks
    else
      render :new
    end
  end
  
  def thanks
  end
  
  def index
    @items = Item()
    @order = Order.new(order_params)
    @shipping = 800
    @total_price = 
    @biling_amount = @shipping + @total_price
  end
  
  def show
    @order = Order.find(params[:id])
    @shipping = 800
  end
  
  private
  
  def order_params
    params.require(:payment_method, :postal_code, :address, :reciver_name)
  end
end
