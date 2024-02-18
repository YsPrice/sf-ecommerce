class RemoveUserForeignKeyFromCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :cart_items, :users
  end
end
