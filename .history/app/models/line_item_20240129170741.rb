class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :order, optional: true

    def total_price
        quantity * product.price # Assuming `quantity` and `product.price` are available
      end
      
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "image", "name", "price", "quantity", "updated_at"]
      end
  end