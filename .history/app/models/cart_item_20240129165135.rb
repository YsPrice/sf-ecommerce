class CartItem < ApplicationRecord
  belongs_to :cart
  after_save :update_cart_totals
  after_destroy :update_cart_totals

  
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["cart_id", "created_at", "id", "product_id", "quantity", "updated_at", "user_id"]
  end
end
