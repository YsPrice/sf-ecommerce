# app/models/cart.rb
class Cart < ApplicationRecord
    has_many :line_items
    has_many :products, through: :line_items
    belongs_to :user, optional: false
  
  
    def update_total_items
      total_items_count = line_items.sum(:quantity)
      
      update(total_items: total_items_count)
    end
    def update_total_price
      total = line_items.joins(:product).sum('line_items.quantity * products.price')
      update(total_price: total)
    end
    def total_price_calculated
      line_items.sum {|item| item.quantity * item.product.price }
    end


    def process_as_order
      order = Order.create(user: self.user, total_price: total_price_calculated, status: 'completed')
      line_items.each do |item|
      order.line_items.create(product: item.product, quantity: item.quantity)
    end
    self.line_items.destroy_all
    order
  end
    private


  end
  