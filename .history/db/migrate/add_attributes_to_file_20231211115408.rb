class AddAttributesToProducts < ActiveRecord::Migration[6.0]
    def change
      add_column :products, :name, :string
      add_column :products, :price, :decimal
      add_column :products, :quantity, :integer
      # Add other columns as needed
    end
  end 