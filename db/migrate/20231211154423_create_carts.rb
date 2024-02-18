class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :total_items
      t.text :item_names
      t.decimal :total_price

      t.timestamps
    end
  end
end
