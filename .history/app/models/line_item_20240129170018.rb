class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :order

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "image", "name", "price", "quantity", "updated_at"]
      end
  end