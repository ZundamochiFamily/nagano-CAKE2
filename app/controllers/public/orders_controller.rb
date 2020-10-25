class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @my_address = "#{current_member.postal_code} #{current_member.address}"
    @my_name = "#{current_member.first_name} #{current_member.last_name}"
  end

  def check

    @order = Order.new

    if params[:order][:payment_method] == "0"
      @payment_method = "クレジットカード"
      @order.payment_method = 0
    elsif params[:order][:payment_method] == "1"
      @payment_method = "銀行振込"
      @order.payment_method = 1
    end

    if params[:order][:address_type] == 'self'
      @address = "#{current_member.postal_code} #{current_member.address} #{current_member.first_name}#{current_member.last_name}"
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.reciever_name = [current_member.first_name, current_member.last_name]
    elsif params[:order][:address_type] == 'registered'
      address = DeliveryDestination.find(params[:order][:address_id])
      @address = address.full_address
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.reciever_name = address.reciever_name
    elsif params[:order][:address_type] == 'registration'
      address = current_member.delivery_destinations.create!(postal_code: params[:order][:postal_code], address: params[:order][:address], reciever_name: params[:order][:reciever_name])
      @address = "#{address.postal_code} #{address.address} #{address.reciever_name}"
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.reciever_name = address.reciever_name
    end

    @cart_items = current_member.cart_items
    @sum = 0
    @tax =1.1
    current_member.cart_items.each do |cart_item|
      price_included_tax = (cart_item.item.tax_excluded_price * @tax).floor
      sub_total = price_included_tax * cart_item.quantity
      @sum += sub_total
    end
    @shipping = 800
    @order.shipping = 800
    biling_amount = @sum + @shipping
    @order.biling_amount = biling_amount
    @biling_amounts = "#{biling_amount.to_s(:delimited, delimiter: ',')}円"
    @ordered_item = OrderedItem.new
  end

  def create
    @cart_items = current_member.cart_items
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    if @order.save
        @cart_items = current_member.cart_items
        @cart_items.each do |cart_item|
          @ordered_item = @order.ordered_items.new
          @ordered_item.item_id = cart_item.item.id
          @tax = 1.1
          @ordered_item.purchased_price = (cart_item.item.tax_excluded_price*@tax).round
          @ordered_item.quantity = cart_item.quantity
          @ordered_item.save
        end
        current_member.cart_items.destroy_all
        redirect_to thanks_orders_path
    else
      request.referer
    end
  end

  def thanks
  end

  def index
    @orders = Order.all
    @shipping = 800
  end

  def show
    @order = Order.find(params[:id])
    @shipping = 800
    @total = []
    @order.ordered_items.each do |ordered_item|
    @total << ordered_item.quantity * ordered_item.purchased_price
    end
   
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :reciever_name)
  end
end
