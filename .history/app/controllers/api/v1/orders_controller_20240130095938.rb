module Api
  module V1
    class OrdersController < ApiController
    

      def create_from_cart
        cart = current_user.cart
        order = cart.process_as_order

        if order.persisted?
          order_details = {
            message: 'Order successfully created from cart',
            order_id: order.id,
            items: order.line_items.map { |item| { name: item.product.name, quantity: item.quantity, price: item.product.price } },
            total_price: order.total_price,
            user_email: current_user.email
          }
          render json: order_details, status: :created
        else
          render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
        end
      end
    end
  end
end
