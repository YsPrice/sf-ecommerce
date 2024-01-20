class LineItem < ApplicationRecord
    belongs_to :product

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "image", "name", "price", "quantity", "updated_at"]
      end
  end