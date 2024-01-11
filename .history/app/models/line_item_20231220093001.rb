class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :order
    # ... other associations and validations as needed
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "image", "name", "price", "quantity", "updated_at"]
      end
  end