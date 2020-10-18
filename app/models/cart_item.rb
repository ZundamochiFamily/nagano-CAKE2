class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :items
  
  def price_included_tax
    cart_items.tax_excluded_price * 1.1
  end
end
