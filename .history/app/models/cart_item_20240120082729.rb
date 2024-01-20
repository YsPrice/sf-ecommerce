class CartItem < ApplicationRecord
  belongs_to :cart
  after_save :update_cart_totals
  after_destroy :update_cart_totals

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
