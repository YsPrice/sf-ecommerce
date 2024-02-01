module Api
  module V1
    class OrdersController < ApiController
      before_action :authenticate_user!

    include JwtAuthenticatable

      def index
        # Fetch orders for the specific user
        orders = @user.orders
        render json: orders
      end

      def create_from_cart
 
        cart = @current_user.cart
    
        if cart.present? && cart.total_items != 0 
          order = cart.process_as_order
          if order.persisted?
            render json: { message: 'Order successfully created from cart', order: order }, status: :created
          else
            render json: { errors: order.errors.full_messages, cart:cart }, status: :unprocessable_entity
          end
        else
          render json: { error: 'No cart found or Cart is empty!' }, status: :not_found
        end
      end
      private

    
  end
end

end
