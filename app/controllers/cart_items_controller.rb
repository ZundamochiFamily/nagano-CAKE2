class CartItemsController < ApplicationController
  before_action :set_cart_item!
  
  #商品詳細画面から「カートに追加」を押したときのアクション
  def create
    if @cart_item.blank?
      @cart_item = CartItem.new(cart_item_params)
      @cart_item = current_cart.item.build(item_id: params[:item_id])
      @cart_item.member_id = current_user.id
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    @item =Item.find_by(id: @cartItem.id)
    redirect_to current_cart, success:"#{@item.item_name}がカートに追加されました"
  end
  

  #カート画面
  def index
    @cart_items = CartItem.find(params:[:id])
  end
  
  #カートの詳細画面から数量の「変更」ボタン
  def update
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end
  
  #カートの1アイテムを削除
  def destroy
    cart_item = CartItem.find_by(item_id: params[:item_id], member_id: current_user.id)
    cart_item.destroy
    redirect_to current_cart
  end
  
  #カートを空にする
  def all_destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to current_cart
  end
  
  private
  
  def set_cart_item!
    @cart_item = current_cart.items.find_by(item_id: params[:item_id])
  end  
 
 def cart_item_params
    params.permit(:quantity, :item_id, :user_id)
 end
end