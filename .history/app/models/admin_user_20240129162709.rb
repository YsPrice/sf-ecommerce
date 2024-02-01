class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:

  devise :database_authenticatable, :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end


end
