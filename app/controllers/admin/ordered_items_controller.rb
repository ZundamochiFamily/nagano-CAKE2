class Admin::OrderedItemsController < ApplicationController

  def update
      @order_detail = OrderedItem.find(params[:id])
		  if @order_detail.update(ordered_items_params)
		    redirect_to admin_order_path(@order_detail.order)
		  else
		     render "show"
		  end
  end

  private

  def ordered_items_params
		  params.require(:ordered_item).permit(:make_status)
  end

end
