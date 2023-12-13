class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_pass
      t.integer :total_orders
      t.text :order_numbers

      t.timestamps
    end
  end
end
