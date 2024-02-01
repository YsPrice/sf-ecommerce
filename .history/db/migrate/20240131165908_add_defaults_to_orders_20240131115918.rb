class AddDefaultsToOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :order_number, :string, default: "default_order_number"
    change_column :orders, :total_items, :integer, default: 0
  end
end
