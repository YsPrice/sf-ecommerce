module Api
  module V1
    class OrdersController < ApiController
      include Devise::Controllers::Helpers
      before_action  :authenticate_api_v1_user!
    
      def create_from_cart
        cart = current_user.cart
    
        if cart.present?
          order = cart.process_as_order
          if order.persisted?
            render json: { message: 'Order successfully created from cart', order: order }, status: :created
          else
            render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: 'No cart found' }, status: :not_found
        end
      end
    end
    
  end
end
