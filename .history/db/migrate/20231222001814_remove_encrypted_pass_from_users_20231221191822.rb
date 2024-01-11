class RemoveEncryptedPassFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_pass
  end
end
