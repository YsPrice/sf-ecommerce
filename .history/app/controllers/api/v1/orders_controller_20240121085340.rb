module Api
  module V1
class OrdersController < ApiController 
    before_action :authenticate_user!
  
    def create_from_cart
      cart = current_user.cart
      order = cart.process_as_order
    
      if order.persisted?
        render json: { message: 'Order successfully created from cart', order: order }, status: :created
      else
        render json: { errors: order.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
end
  