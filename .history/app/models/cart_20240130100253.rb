class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  def process_as_order
    Order.transaction do
      order = Order.create!(user: self.user, total_price: self.total_price)
      self.line_items.each do |item|
        order.line_items.create!(product: item.product, quantity: item.quantity)
      end
      self.line_items.destroy_all
      order
    end
  end
  def update_cart_totals
    update_total_items
    update_total_price
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
