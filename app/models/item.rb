class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orderd_items, dependent: :destroy
  belongs_to :genre

 attachment :item_image
 
end

