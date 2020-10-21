class Public::CartItemsController < ApplicationController
  #商品詳細画面から「カートに追加」を押したときのアクション
  def create
    if current_member.cart_item.blank?
      item = Item.find(params[:item_id])
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.member_id = current_member.id
      @cart_item.item_id = item.id
      @cart_item.quantity += params[:quantity].to_i
      @cart_item.save
      redirect_to cart_items_path, success:"#{item.item_name}がカートに追加されました"
    end
  end
  

  #カート画面
  def index
    @cart_items = CartItem.all
    @sum = 0
  end
  
  #カートの詳細画面から数量の「変更」ボタン
  def update
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_back fallback_location
  end
  
  #カートの1アイテムを削除
  def destroy
    cart_item = CartItem.find_by(item_id: params[:item_id])
    cart_item.destroy
    redirect_back fallback_location
  end

  #カートを空にする
  def all_destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_back fallback_location, success:"カートが空になりました"
  end
  
  private
 
 def cart_item_params
    params.permit(:quantity).merge(member_id:current_member.id, item_id:item.id)
 end
end
