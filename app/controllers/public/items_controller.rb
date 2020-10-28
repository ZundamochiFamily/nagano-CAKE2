class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all.where(is_activated: 'true')
    @tax = 1.1
  end

  def show
    @genres = Genre.all.where(is_activated: 'true')
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @tax = 1.1
  end

end