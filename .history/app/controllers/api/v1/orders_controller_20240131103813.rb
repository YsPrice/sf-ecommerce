module Api
  module V1
  
    class OrdersController < ApiController
      include JwtAuthenticatable
      before_action :authenticate_user!
      before_action :set_user

      def index
        # Fetch orders for the specific user
        orders = @user.orders
        render json: orders
      end

      def create_from_cart
 
        cart = @user.cart
        render json: {cart: cart}
      end
      #   if cart.present?
      #     order = cart.process_as_order
      #     if order.persisted?
      #       render json: { message: 'Order successfully created from cart', order: order }, status: :created
      #     else
      #       render json: { errors: order.errors.full_messages, cart:cart }, status: :unprocessable_entity
      #     end
      #   else
      #     render json: { error: 'No cart found' }, status: :not_found
      #   end
      # end
      private

      def set_user
        @user = User.find(params[:user_id])

        # Ensuring that the user from params is the current authenticated user
        if @user != current_user
          render json: { error: 'You can only access your own orders.' }, status: :forbidden
        end
      end
    
  end

end
end
