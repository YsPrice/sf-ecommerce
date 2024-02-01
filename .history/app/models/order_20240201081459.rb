# app/models/order.rb
class Order < ApplicationRecord
    belongs_to :user
    has_many :line_items
    has_many :products, through: :line_items
    has_many :cart_items
    before_save :create_order_number
enum status: {pending: 'pending', completed: 'completed'}
  
    validates :status, presence: true
  
    def total_price
      line_items.sum(&:total_price)
    end

    # def self.ransackable_attributes(auth_object = nil)
    #   ["created_at", "id", "image", "name", "price", "quantity", "updated_at", "total_items_eq",
    #     "total_items_gt","total_price_eq","total_items_lt","total_price_gt","total_price_lt","order_number_cont",
    #   "order_number_eq","order_number_start","order_number_end","status_cont","status_eq","status_start","status_end"]
    # end

    def self.ransackable_associations(auth_object = nil)
      ["cart_items", "line_items", "products", "user"]
    end

    private 
    def create_order_number
      self.order_number = SecureRandom.hex(60)
    end
    def calculate_total_items
      self.total_items = self.line_items.sum(&:quantity)
    end
  end
  