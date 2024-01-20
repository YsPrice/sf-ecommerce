class OrdersController < ApiController 
    before_action :authenticate_user!
  
    def create_from_cart
      cart = current_user.cart
      order = current_user.orders.new
      cart.cart_items.each do |cart_item|
        order.order_items.new(product: cart_item.product, quantity: cart_item.quantity)
      end
  
      if order.save
        cart.cart_items.destroy_all # Clear the cart
        render json: order, status: :created
      else
        render json: order.errors, status: :unprocessable_entity
      end
    end
  end
  