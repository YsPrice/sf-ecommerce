class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :user_id
      t.integer :cart_id
      t.integer :total_items
      t.decimal :total_price
      t.string :order_number

      t.timestamps
    end
  end
end
