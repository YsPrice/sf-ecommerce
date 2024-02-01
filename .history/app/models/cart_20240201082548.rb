class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  def process_as_order
    Order.transaction do
      
      order = Order.create!(user: self.user, total_price: self.total_price)

      # Temporarily store total items and price before clearing cart items
      total_items_count = cart_items.sum(:quantity)
      total_price_value = cart_items.joins(:product).sum('cart_items.quantity * products.price')

      self.cart_items.each do |cart_item|
        order.line_items.create!(product: cart_item.product, quantity: cart_item.quantity)
      end

      # Destroy cart items after creating line items in order
      self.cart_items.destroy_all

      # Update totals after cart items have been processed
      update(total_items: total_items_count, total_price: total_price_value)

      order
    end
  end


  def update_total_items
    total_items_count = cart_items.sum(:quantity)
    update(total_items: total_items_count)
  end

  def update_total_price
    total = cart_items.joins(:product).sum('cart_items.quantity * products.price')
    update(total_price: total)
  end
end
def cart_items_details
  cart_items.includes(:product).map do |item|
    {
      product_id: item.product.id,
      name: item.product.name,
      price: item.product.price,
      quantity: item.quantity
    }
  end
end
