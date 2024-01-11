class RemoveEncryptedPassAndUsernameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :encrypted_pass
    remove_column :users, :username
  end
end
