module Api
  module V1
    
    class OrdersController < ApiController

      # before_action  :authenticate_api_v1_user!
    
      def create_from_cart
        Rails.logger.info "Headers: #{request.headers['Authorization']}"
        Rails.logger.info "Current User: #{@user.inspect}"
        cart = @user.cart
    
        if cart.present?
          order = cart.process_as_order
          if order.persisted?
            render json: { message: 'Order successfully created from cart', order: order }, status: :created
          else
            render json: { errors: order.errors.full_messages, cart:cart }, status: :unprocessable_entity
          end
        else
          render json: { error: 'No cart found' }, status: :not_found
        end
      end
    end
    
  end
end
