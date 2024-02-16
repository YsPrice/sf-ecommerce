module Api
  module V1
    class CartsController < ApplicationController 
      include Devise::Controllers::Helpers
      before_action :set_cart, only: [:show, :update, :destroy]

      # GET /api/v1/carts/:id
      def show
        render json: @cart
      end

      # POST /api/v1/carts
      def create
        @cart = Cart.new(user_id: current_user.id)
        if @cart.save
          render json: @cart, status: :created
        else
          render json: @cart.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/carts/:id
      def update
        if @cart.update(cart_params)
          render json: @cart
        else
          render json: @cart.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/carts/:id
      def destroy
        @cart.destroy
        head :no_content
      end

      private


        def set_cart
          @cart = current_user.cart
        end
        
        def authenticate_user!
          # Here, devise should automatically set the current_user
          unless current_user
            render json: { error: 'Not Authenticated' }, status: :unauthorized
          end
        end
     

      def cart_params
       
        params.require(:cart).permit(:user_id)
      end
    end
  end
end
