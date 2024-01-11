class RemoveOrdersIdAndCartsIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :orders_id, :integer
    remove_column :users, :carts_id, :integer
  end
end
