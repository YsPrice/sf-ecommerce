# app/models/cart.rb
class Cart < ApplicationRecord
    has_many :line_items
    has_many :products, through: :line_items
    belongs_to :user, optional: false
  
  
    def update_total_items
      update(total_items: cart_items.sum(:quantity))
    end
    def update_total_price
      total = cart_items.joins(:product).sum('quantity * products.price')
      update(total_price: total)
    end

    def process_as_order
      order = Order.create(user: self.user, total_price: total_price, ...)
      self.line_items.each do |item|
      order.line_items.create(product: item.product, quantity: item.quantity, ...)
    end
    self.line_items.destroy_all
    order
  end
    private
    
    def total_price
      line_items.sum(&:total_price)
    end
  end
  