class CreateProduct < ActiveRecord::Migration[7.0]
  def change
    create_table :product do |t|
      t.name :string,
      t.price :decimal,
      t.quantity :integer,
      
      t.timestamps
  
  end
end
