class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all.where(is_activated: 'true')
    @items = Item.limit(4)
  end

  def about
  end

end
