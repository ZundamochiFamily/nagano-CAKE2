class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :orderd_items, dependent: :destroy
  belongs_to :genre

  attachment :item_image

<<<<<<< HEAD
<<<<<<< HEAD
 #enum sales_status:{onsale:0,soldout:1}

 attachment :item_image

=======
 
>>>>>>> 18066bc08245cc68b20f5e7aa468eaac8eaddad6
=======

>>>>>>> 129f13a2873e558261d1f742d490a559915cfc72
end

