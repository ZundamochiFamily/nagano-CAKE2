class RenameReciverColumnToOrders < ActiveRecord::Migration[5.2]
  def change
        rename_column :orders, :reciver_name, :reciever_name
  end
end
