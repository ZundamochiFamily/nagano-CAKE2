class ApplicationController < ActionController::Base
  
  helper_method :current_cart
  
  private
  
  def current_cart
    # セッションから取得したuser_idを元にItemテーブルからCart_items情報を取得
    current_cart = CartItem.find_by(id: session[:cart_item_id])
    # Cartitem情報が存在しない場合、current_cartを作成
    current_cart = CartItem.create unless current_cart
    # 取得したCartitem情報よりIDを取得し、セッションに設定
    session[:cart_item_id] = current_cart.id
    # CartItem情報を返却
    current_cart
  end

end
