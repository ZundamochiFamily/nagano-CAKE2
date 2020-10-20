class Admin::OrderedItemsController < ApplicationController
  
  def update
    @ordered_item = OrderedItem.find(params[:id])
    @ordered_item.update(ordered_item_params)
    redirect_to @order
    
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:make_status)
  end


end