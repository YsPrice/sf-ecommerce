module Api
    class CartsController < ApplicationController
      before_action :authenticate_user!
  
      def show
        cart = current_user.cart
        if cart
          render json: cart.as_json(include: { 
            line_items: { 
              include: :product 
            } 
          }, methods: :total_price)
        else
          render json: { error: 'Cart not found' }, status: :not_found
        end
      end
    end
  end
  