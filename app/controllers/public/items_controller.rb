class Public::ItemsController < ApplicationController
<<<<<<< HEAD
=======

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

>>>>>>> c5c6de1406e6b632c65477b1f9ca9655df8b8fa5
end
