# app/models/order.rb
class Order < ApplicationRecord
    belongs_to :user
    has_many :line_items
    has_many :products, through: :line_items
    has_many :cart_items
enum status: {pending: 'pending', completed: 'completed'}
  
    validates :status, presence: true
  
    def total_price
      line_items.sum(&:total_price)
    end
    def self.ransackable_attributes(auth_object = nil)
      ["allow_password_change", "confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "email", "encrypted_password", "id", "image", "name", "nickname", "provider", "remember_created_at", "reset_password_sent_at", "reset_password_token", "tokens", "uid", "unconfirmed_email", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
      ["cart_items", "line_items", "products", "user"]
    end
    # Other attributes and methods as needed
  end
  