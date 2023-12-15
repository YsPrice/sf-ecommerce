class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.integer :total_items
      t.decimal :total_price
      t.string :order_number

      t.timestamps
    end
    add_foreign_key :orders, :users, column: :user_id

  end
end
