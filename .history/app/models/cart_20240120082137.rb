# app/models/cart.rb
class Cart < ApplicationRecord
    has_many :line_items
    has_many :products, through: :line_items
    belongs_to :user, optional: false
  
    def total_price
      line_items.sum(&:total_price)
    end
    def update_total_items
      update(total_items: cart_items.sum(:quantity))
    end
    def update_total_price
      total = cart_items.joins(:product).sum('quantity * products.price')
      update(total_price: total)
    end
    # Other attributes and methods as needed
  end
  