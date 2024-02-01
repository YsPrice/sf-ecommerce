class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  after_save :update_cart_totals
  after_destroy :update_cart_totals
  after_initialize :set_defaults
  validates :product_id, presence: true

  
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  def set_defaults
    self.quantity ||= 0
  end
  def update_cart_totals
    cart.update_cart_totals if cart.present?
  end

end
