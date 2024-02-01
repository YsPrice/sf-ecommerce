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
      ["created_at", "id", "image", "name", "price", "quantity", "updated_at", "total_items_eq",
        "total_items_gt","total_price_eq","total_items_lt","total_price_gt","total_price_lt","order_number_cont",
      "order_number_eq","order_number_start"]
    end

    def self.ransackable_associations(auth_object = nil)
      ["cart_items", "line_items", "products", "user"]
    end

  end
  