class Product < ActiveRecord::Migration[7.0]
  def change
    create_table :product do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
