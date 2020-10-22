class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orderd_items, dependent: :destroy
  belongs_to :genre

 enum sales_status:{onsale:0,soldout:1}
 
 attachment :item_image

end

