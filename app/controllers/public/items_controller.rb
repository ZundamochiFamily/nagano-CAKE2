class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all.where(is_activated: 'true')
  end

  def show
    @genres = Genre.all.where(is_activated: 'true')
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
