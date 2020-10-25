class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orderd_items, dependent: :destroy
  belongs_to :genre
<<<<<<< HEAD

 #enum sales_status:{onsale:0,soldout:1}

 attachment :item_image
end

=======
  attachment :item_image
end
>>>>>>> 647bda17bc7dacb6759bd9a2388472189bb21479
