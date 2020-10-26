class OrderedItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  enum make_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

  def tax_included_price
    (self.item.tax_excluded_price * 1.1).to_i
  end
  
  def total_amount
    (self.quantity * tax_included_price).to_i
  end
  
end
