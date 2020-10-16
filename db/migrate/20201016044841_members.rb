class Members < ActiveRecord::Migration[5.2]
  def change
    drop_table :members
    drop_table :admins
  end
end
