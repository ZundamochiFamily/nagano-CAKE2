class CreateDeliveryDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_destinations do |t|
      t.integer "member_id"
      t.string "postal_code"
      t.string "address"
      t.string "reciever_name"
      t.timestamps
    end
  end
end
