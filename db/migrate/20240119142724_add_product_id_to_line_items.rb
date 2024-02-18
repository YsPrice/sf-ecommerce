class AddProductIdToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :cart_id, :integer, null: false
  end
end
