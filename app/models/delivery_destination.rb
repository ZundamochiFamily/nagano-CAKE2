class DeliveryDestination < ApplicationRecord
  belongs_to :member
  
  def full_address
    "#{postal_code} #{address} #{reciever_name}"
  end
end
