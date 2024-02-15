module Api
  module V1
    
    class OrdersController < ApiController

      before_action  :authenticate_api_v1_user!
    
      def test_authentication
        if current_user
          render json: { message: "Authenticated as #{current_user.email}" }, status: :ok
        else
          render json: { error: 'Not authenticated' }, status: :unauthorized
        end
      end
      # def create_from_cart
      #   Rails.logger.info "Headers: #{request.headers['Authorization']}"
      #   Rails.logger.info "Current User: #{current_user.inspect}"
      #   cart = current_user.cart
    
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
    
    
  end
end
end