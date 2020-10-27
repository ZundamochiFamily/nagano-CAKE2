class DeliveryDestination < ApplicationRecord
  belongs_to :member
  
  def full_address
    "#{self.postal_code} #{self.address} #{self.reciever_name}"
  end
  
  
  
end
