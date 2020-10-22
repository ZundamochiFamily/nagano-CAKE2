class Public::CartItemsController < ApplicationController
  #商品詳細画面から「カートに追加」を押したときのアクション
  def create
    if @cart_item = current_member.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.quantity += params[:cart_item][:quantity].to_i
      @cart_item.save
      redirect_to cart_items_path, success:"#{@cart_item.item.item_name}の数量を変更しました"
    else
      @cart_item = current_member.cart_items.build(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path, success:"#{@cart_item.item.item_name}がカートに追加されました"
    end
  end

  #カート画面 
  def index
    @cart_items = CartItem.all
    @sum = 0
    @tax =1.1
    current_member.cart_items.each do |cart_item|
      price_included_tax = (cart_item.item.tax_excluded_price * @tax).floor
      sub_total = price_included_tax * cart_item.quantity
      @sum += sub_total
    end
  end
  
  #カートの詳細画面から数量の「変更」ボタン
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_back(fallback_location: cart_items_path)
  end
  
  #カートの1アイテムを削除
  def destroy
    cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
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
    params.require(:cart_item).permit(:quantity, :item_id)
 end
end
