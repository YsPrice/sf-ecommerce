class Product < ApplicationRecord
    validates :name, :price, :quantity, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
    
    has_many :line_items, class_name: 'LineItem'
    has_many :orders, through: :line_items
    enum category: [:STREET_FIGHTER_3, :STREET_FIGHTER_2, :STREET_FIGHTER_4]
    def self.ransackable_associations(auth_object = nil)
      ["line_items", "orders"]
    end
  
      def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "image", "name", "price", "quantity", "category","updated_at"]
  end
    # end
  end
  
  # active admin gem, good for creating resources.
  # login as admin and create products through ui
