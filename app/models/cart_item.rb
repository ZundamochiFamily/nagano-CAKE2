class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item
  
  def tax
    return self.item.tax_excluded_price * 1.1
  end
end


