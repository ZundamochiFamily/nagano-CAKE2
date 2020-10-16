class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer "member_id"
      t.integer "shipping"
      t.integer "biling_amount"
      t.integer "payment_method", default: 0
      t.string "reciver_name"
      t.string "postal_code"
      t.string "address"
      t.integer "order_status", default: 0

      t.timestamps
    end
  end
end
