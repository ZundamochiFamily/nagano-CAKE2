class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item
  
  validates :quantity, presence: true
end

