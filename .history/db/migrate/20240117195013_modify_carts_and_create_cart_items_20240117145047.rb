class ModifyCartsAndCreateCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :item_names, :text

    create_table :cart_items do |t|
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
